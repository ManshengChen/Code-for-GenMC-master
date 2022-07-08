clear;
addpath(genpath('./'));
load('MSRC-v1.mat');
gt = Y+1;

%parameters
gamma = 1; 
lambda = 1;
beta = [10,10,10,10]';

N = size(X{1},1); %datasize
H = cell(1,4);
I = eye(N);

for i = 1:4
    A{i} = constructW_PKN(X{i}',10);
    D{i} = diag(sum(A{i},2));
    L{i} = I-((D{i})^(-0.5)*(A{i}+I)*(D{i})^(-0.5));
    H{i} = (I-gamma*L{i})*X{i};
    H{i} = H{i}';
end

My_result = GenMC_MSRC(H,gt,lambda,beta)  %four views
