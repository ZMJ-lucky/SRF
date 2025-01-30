function center = Init_modes(x, pm)
    sim_x_X = zeros(pm.n, 1); % 初始化 sim_x_X
    disp([pm.d,pm.n]);
    % 计算 sim_x_X
     % 逐列计算相似性
    for m = 1:pm.d
        sub_data = x(:, m);
        [~, ~, idx] = unique(sub_data); % 获取唯一值和索引
        counts = accumarray(idx, 1); % 计算每个唯一值的频数
        
        % 构造频数矩阵
        freq_map = counts(idx) / pm.n; % 每个样本的归一化频数
        sim_x_X = sim_x_X + freq_map; % 累加到总相似度
    end

    % 平均化相似度
    sim_x_X = sim_x_X / pm.d;
    disp(sim_x_X)
    % 找到最大 sim_x_X 的索引
    [~, index] = max(sim_x_X);
    disp(x(index, :))
    u=zeros(pm.k,pm.d);
    u(1,:) = x(index, :); % 初始化中心点集合
    for i = 2:pm.k
        sim_x_U = zeros(pm.n, 1); % 初始化 sim_x_U
        for j = 1:pm.n
            sim = 0;
            for d = 1:pm.d
                % 获取 u 中的第 d 列
                sub_data = u(:, d);
                [value, number] = groupcounts(sub_data); % 计算唯一值及其频数
                index = find(value == x(j, d));
                if ~isempty(index)
                    sim = sim + number(index) / (i - 1);
                else
                    sim = sim + 0;
                end
            end
            sim_x_U(j) = sim / pm.d;
        end
        % 计算 d_sim_x_U 和 pry
        d_sim_x_U = 1 - sim_x_U;
        pry = d_sim_x_U + sim_x_X;

        % 找到最大 pry 的索引
        [~, index_p] = max(pry);
        u(i,:)= x(index_p, :); % 添加到中心点集合
    end

    center = u; % 返回中心点集合
end
