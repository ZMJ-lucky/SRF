function SDT_matrix = SCOF_v9_Graph(x, pm, y_pred)
    % 输入：
    % x      : categorical 数据 (样本数 x 属性数)
    % pm     : 包含参数信息的结构体，pm.no_values(s) 是第 s 个属性可能取值数
    % y_pred : 当前样本划分结果 (样本数 x 1)
    
    % 输出：
    % SDT_matrix : 距离矩阵 cell(1, pm.k), 每个元素为一个 cell(1, pm.d)
    
    % 初始化 SDT_matrix
    SDT_matrix = cell(1, pm.k);  % 每个簇一个 cell
    eps=1e-10;
    % 簇数和属性数
    k = pm.k;  % 簇的数量
    d = pm.d;  % 属性的数量
    
    % 遍历每个簇 c
    for c = 1:k
        % 获取属于簇 c 的样本索引
        cluster_idx = find(y_pred == c);
        cluster_samples = x(cluster_idx, :);
        num_samples_c = length(cluster_idx);
        
        % 初始化当前簇的属性距离结构
        SDT_matrix{c} = cell(1, d);
        
        % 遍历每个属性 s
        for s = 1:d
            % 当前属性的可能取值数
            num_values_s = pm.no_values(s);
            
            % 初始化属性的距离矩阵
            dist_matrix = zeros(num_values_s, num_values_s);
            
            % 条件熵分量计算
            % 1. 计算每个可能取值 i 的条件熵
            cond_entropy_all = zeros(1, num_values_s);  % 存储所有簇上的条件熵
            for i = 1:num_values_s
                % 条件熵计算的分子：簇内第 s 属性值为 i 的样本数
                num_i_in_c = sum(cluster_samples(:, s) == i);
                
%                 % 条件熵计算的分母：所有样本第 s 属性值为 i 的样本数
%                 num_i_total = sum(x(:, s) == i);
                
                % 条件熵计算：P(i|c) * log(P(i|c))
                if num_i_in_c > 0
                    p_i_given_c = num_i_in_c / num_samples_c;
%                     cond_entropy_all(i) = -p_i_given_c * log2(p_i_given_c / (num_i_total / size(x, 1) + eps));
                    cond_entropy_all(i) = p_i_given_c;
                end
            end
            
            % 2. 构建距离矩阵
            for i = 1:num_values_s
                for j = i+1:num_values_s
                    % 计算两个条件熵值
                    cond_entropy_i = cond_entropy_all(i);
                    cond_entropy_j = cond_entropy_all(j);
                    
                    % 归一化条件熵分量
                    normalization = sum(cond_entropy_all) + eps;
%                     disp(normalization)
                    dist_matrix(i, j) =abs((cond_entropy_i / normalization) - (cond_entropy_j / normalization)) ;
%                     disp(normalization)
                    dist_matrix(j, i)=dist_matrix(i, j);
                    
                   
                end
            end
%             dist_matrix(dist_matrix==0)=0.00000001;
%             disp(dist_matrix)
%             [A_TreeDistMtx,~]=primMST(dist_matrix);
%             disp(A_TreeDistMtx)
            % 存储当前属性的距离矩阵
            SDT_matrix{c}{s} = dist_matrix;
%             SDT_matrix{c}{s}=A_TreeDistMtx;
        end
    end
end
