function [MinTree_DistMtx, OrderTree_Trace]=primMST(compete_graph)
    n = size(compete_graph, 1); % 图的顶点数
    selected = false(1, n); % 记录顶点是否被选中
    parent = zeros(1, n); % 记录每个顶点的父节点
    key = inf(1, n); % 记录每个顶点与最小生成树的连接边的权重
    % 选择初始顶点，选择最小权重边的起点下标较小的顶点
    [~, start] = min(min(compete_graph));
    key(start) = 0;
%     disp(compete_graph)
    %disp(start);
    %disp(compete_graph);
    for i = 1:n
        % 选择当前最小权重的顶点
        u = minKey(key, selected);
        selected(u) = true;
        % 更新与选中顶点相邻的顶点的权重值
        for v = 1:n
            if compete_graph(u, v) > 0 && ~selected(v) && compete_graph(u, v) < key(v)
                parent(v) = u;
                key(v) = compete_graph(u, v);
%                 break
            end
        end
    end
 
    G = graph;
    
    % 添加节点
    G = addnode(G, n);
    
    % 添加边
    for i = 1:n
        if parent(i)~=0
            G = addedge(G, parent(i), i, compete_graph(i, parent(i)));
        end
    end

%     % 绘制图
%     plot(G, 'EdgeLabel', G.Edges.Weight);
%     pause
    MinTree_DistMtx=zeros(n); %构建树结构order的距离矩阵
    OrderTree_Trace=cell(n);
    % 找到节点之间的最短路径
    for i=1:n
        for j=i+1:n
            [shortest_path,dist_minTree] = shortestpath(G, i, j);
            MinTree_DistMtx(i,j)=dist_minTree;
            MinTree_DistMtx(j,i)=MinTree_DistMtx(i,j);
            OrderTree_Trace{i,j}=shortest_path;
            OrderTree_Trace{j,i}=OrderTree_Trace{i,j};
         
%             disp(shortest_path);
%             disp(dist_minTree);
%             pause
        end
    end
%     disp(MinTree_DistMtx);
%     pause
 
end

function u = minKey(key, selected)
    min_val = inf;
    u = -1;
    
    for i = 1:length(key)
        if ~selected(i) && key(i) < min_val
            min_val = key(i);
            u = i;
        end
    end
%     disp(key)
%     disp(min_val)
%     disp(u)
end


