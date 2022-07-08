clear;
addpath(genpath('./'));
load('ACM3025.mat');

%parameters
gamma = 0.8; 
lambda = 0.01;
beta = [8,10]';

[~, gt] = max(label, [], 2);
X = feature;
N = size(X,1); % datasize
H = cell(1,2);
I = eye(N);
A{1} = PAP;
A{2} = PLP;

for i = 1:2
    D{i} = diag(sum(A{i},2));
    L{i} = I-((D{i})^(-0.5)*(A{i}+I)*(D{i})^(-0.5));
    H{i} = (I-gamma*L{i})*X;
    H{i} = H{i}';
end

My_result = GenMC_ACM(H,gt,lambda,beta)
