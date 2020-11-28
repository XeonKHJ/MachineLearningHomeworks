load('ex4data1.mat');

%将X缩到0和1之间！
xMax = max(X,[], 'all');
xMin = min(X,[], 'all');
X = (X - xMin)/(xMax - xMin);

Y = y;

loss = Inf;

% 获取权重大小
weightSize = [];
neuralSize = [400, 15, 10]
W = {[401, 15], [16, 10]}; 

W{1} = randn(401, 15)/10;
W{2} = randn(16, 10)/10;

% 学习率
learningRate = 0.00001;

%随机生成权重；

while loss > 0.01
    %先前传播
    [pY, A] = forwardPropagation(neuralSize, X, W);

    %计算损失函数
    loss = crossEntropy(pY, y);

    %向后传播计算梯度
    gd = backPropagation(A, W, pY, y);
    
    %梯度下降
    W{1} = W{1} - learningRate * gd{1};
    W{2} = W{2} - learningRate * gd{2};
end