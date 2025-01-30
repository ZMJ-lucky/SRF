
% compare the new idea with k-modes type algorithms

clear;
clc;

% experimental settings
rep_time = 10; % repeat 50 times 
no_counter = 11; % number of counterparts
counter_first = 1; % location of the first counterpart
counter_last = no_counter; % location of the first counterpart
mode_initial_type = 2; % initialization type of cluster modes, ...
                                      %1 for random initialization, 2 for non-duplicated random initializati

%% Clustering for CE
load CE.mat;
x= CE;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1);
ncc=zeros(rep_time,1);
cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 70);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI);
nccMean=mean(ncc);
nccStd=std(ncc);
cpsMean=mean(cps);
cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on CE data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")
%% Clustering for SBL
load SBL.mat;
% x= SBL;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 142);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on SB data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")
%% Clustering for NS
load NS.mat;
x= NS;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 1);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on NS data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")
%% Clustering for CC
load CC_c.mat;
x= CC_c;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 16);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on CC data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for AP
load AP_c.mat;
x= AP_c;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 22);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on AP data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")
%% Clustering for DT
load DT_c.mat;
x= Dt_c;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 99);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on DT data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for AV
load AV.mat;
x= AV;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 66);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on AV data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")
%% Clustering for OB
load OB.mat;
x= obesity;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 162);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on OB data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for TA
load TA_c.mat;
x= TA_c;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 156);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on TA data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for BM
load BM.mat;
x= BM;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 50);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on BM data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for VT
load VT.mat;
x= VT;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 1);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on VT data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")

%% Clustering for ZO
load ZO.mat;
x= ZO;
CA=zeros(rep_time,1);
ARI=zeros(rep_time,1);
NMI=zeros(rep_time,1); ncc=zeros(rep_time,1); cps=zeros(rep_time,1);
[ pm.n , pm.d ] = size( x );
label = x( : , pm.d );
pm.d = pm.d - 1;
x = x( : , 1 : pm.d );
pm.k = length( unique( label ) );
%     disp(pm.k);
for t = 1 : pm.d
    pm.no_values( t ) = length( unique( x( : , t ) ) );
end
rand('seed', 267);
for t=1:rep_time
%     modes_init=[1     5     1     2     2     1     2     2;
%      1     4     2     4     3     1     1     1;
%      1     3     3     3     1     1     2     3;
%      3     4     3     2     1     1     3     1;
%      2     4     1     4     2     2     2     3];
%     modes_init=Init_modes(x,pm);
    [CA(t),ARI(t),NMI(t),ncc(t),cps(t)] = SADC(x , label , pm , mode_initial_type);
end
AccMean=mean(CA);
ACCStd=std(CA);
ARIMean=mean(ARI);
ARIStd=std(ARI);
NMIMean=mean(NMI);
NMIStd=std(NMI); nccMean=mean(ncc); nccStd=std(ncc); cpsMean=mean(cps); cpsStd=std(cps);
disp("----------------------------")
disp('clustering performance on ZO data set:');
fprintf('%.4f ± %.4f   %.4f ± %.4f   %.4f ± %.4f  %.4f ± %.4f  %.4f ± %.4f\n', AccMean, ACCStd, ARIMean, ARIStd, NMIMean, NMIStd, nccMean, nccStd, cpsMean, cpsStd);
disp("----------------------------")