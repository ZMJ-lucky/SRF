function [ acc , ari , nmi,ncc,cps ] = SADC( x , label , pm , mode_initial_type )
% initialize the k modes according to mode_initial_type
if mode_initial_type == 1
    modes = x( randperm( pm.n , pm.k ) , 1 : pm.d );
end
if mode_initial_type == 2
    modes( 1 , : ) = x( randperm( pm.n , 1 ) , 1 : pm.d );
    no_initial_mode = 1;
    while no_initial_mode ~= pm.k
        no_initial_mode = no_initial_mode + 1;
        modes( no_initial_mode , : ) = x( randperm( pm.n , 1 ) , 1 : pm.d );
        if sum ( sum( modes == modes( no_initial_mode , : ) , 2 ) == pm.d ) ~= 1
            no_initial_mode = no_initial_mode - 1;
        end
    end
end
% modes=mode_initial_type;
% disp(modes)
[modes,LctRecFOld]=kmd_clustering(x, pm, modes);
% disp(modes)
% disp("1. finish KMD ");
SDT_matrix=SCOF_v9_Graph(x,pm,LctRecFOld);
%% ---------------------------Finish initialize-----------------------------
LctRecC=zeros(pm.n,1); % initialize the 1st partition Q ... ...
FChange=1; % set convergence judger for launching the algorithm loop (Step 2 - 3 of DLC Algorithm)
LoopD=0; % set loop counter ... ...
cost_loop=1;
FunctionLost=zeros(1,10000);
while FChange==1 && LoopD<=50 % outer loop formed by Step 2 and Step 3
    LoopD=LoopD+1;
%     disp(LoopD)
%     disp(modes)
%     disp("-------------------")
    [LctRecC,modes,Loss]=ISCOF(x,pm,SDT_matrix,LctRecC,modes); % inner loop, i.e., Step 2
    non_zero_elements = Loss(Loss ~= 0);
    inner_times=length(non_zero_elements);
%     disp(inner_times)
    FunctionLost(cost_loop:cost_loop+inner_times-1)=non_zero_elements;
    cost_loop=cost_loop+inner_times;
%     disp(["Finish run:",LoopD])
%     disp(modes)
%     disp(sum(LctRecFOld-LctRecC))
%     temp_ari=Eva_ARI(LctRecFOld,LctRecC);
%     disp(temp_ari)
%     pause
    if  abs(sum(LctRecFOld-LctRecC))<=0.001*pm.d % judge if outer loop converge or not
        FChange=0;
    else 
        LctRecFOld=LctRecC; 
        SDT_matrix=SCOF_v9_Graph(x,pm,LctRecFOld);
    end      
end
% non_zero_cost = FunctionLost(FunctionLost ~= 0);
% % 绘制 FunctionLost 的折线图
% figure;
% 
% % 绘制 FunctionLost 的折线图
% figure;
% plot(non_zero_cost, '-o', 'DisplayName', 'FunctionLost', 'LineWidth', 2);
% hold on;
% 
% % 设置图例
% legend;
% 
% % 设置标题和轴标签
% title('FunctionLost and Non-Zero Elements');
% xlabel('Index');
% ylabel('Value');
% 
% % 显示网格
% grid on;
disp(LoopD);
% pause
acc=Eva_CA(LctRecC,label); % CA evaluation
ari=Eva_ARI(LctRecC, label, 'adjusted'); % ARI evaluation
nmi=Eva_NMI(LctRecC, label); % NMI evaluation
ncc=Eva_ncc(LctRecC,x,pm.d);
cps=Eva_CPS(LctRecC,x,pm.d);
% acc
% ari
% nmi
% pause
end
