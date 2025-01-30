function ncc = Eva_ncc(Cluster_lable,x,n)

%%%Eq.(33)
% n is the number of attributes (categorical).
[m,~] = size(x);
Y = zeros(m,m);
for r = 1:m
    for s = 1:m
        if Cluster_lable(r) == Cluster_lable(s)
            Y(r,s) = 1;
        end
    end
end

drs = zeros(m,m);
for r = 1:m
    for s = 1:m
        for att = 1:n
            if x(r,att) ~= x(s,att)
                drs(r,s) = drs(r,s) + 1;
            end
        end
    end
end

ncc = 0;
for r = 1:m
    for s = 1:m
        if r~= s
            ncc = ncc + (n - 2*drs(r,s))*Y(r,s) + drs(r,s);
        end
    end
end