function Compactness = Eva_CPS(Cluster_lable,x,n)
% n is the number of attributes (categorical).

[m,~] = size(x);
t = length(unique(Cluster_lable));
R = cell(1,t);
value_lable = unique(Cluster_lable);
number_in_cluster = zeros(1,t);

for i = 1:m
    for j = 1:t
        if Cluster_lable(i) == value_lable(j)
            number_in_cluster(1,j) = number_in_cluster(1,j) + 1;
        end
    end
end

for i = 1:t
    if number_in_cluster(1,i) > 0
        R{i} = zeros(number_in_cluster(1,i),n);
    else
        R{i} = []; % 防止后续索引错误
    end
end

% Record cluster R
for i = 1:t
    count_x_in_rt = 1;
    for j = 1:m
        if Cluster_lable(j) == value_lable(i)
            for v = 1:n
                R{i}(count_x_in_rt,v) = x(j,v);     
            end
            count_x_in_rt = count_x_in_rt + 1;
        end
    end
end

% Eq.39
dm = zeros(1,t);
for i = 1:t
    if number_in_cluster(1,i) > 1  % 避免除零错误
        for j = 1:number_in_cluster(1,i)
            for k = j+1:number_in_cluster(1,i)
                for l = 1:n
                    % Eq.38
                    dt = 0;
                    if R{i}(j,l) ~= R{i}(k,l)
                        dt = 1;
                    end
                    dm(1,i) = dm(1,i) + dt^2;
                end
            end
        end
        dm(1,i) = dm(1,i) / (number_in_cluster(1,i) * (number_in_cluster(1,i)-1));
    else
        dm(1,i) = 0; % 避免 NaN
    end
end

Compactness = 0;
for i = 1:t
    if ~isnan(dm(1,i))  % 避免 NaN 传播
        Compactness = Compactness + dm(1,i) * (number_in_cluster(1,i) / m);
    end
end
