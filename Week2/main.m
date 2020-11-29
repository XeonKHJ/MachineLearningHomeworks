load('ex4data1.mat');

%将X缩到0和1之间！
xMax = max(X,[], 'all');
xMin = min(X,[], 'all');
X = (X - xMin)/(xMax - xMin);

Y = y;

loss = Inf;

% 拿训练集

% 拿测试机
XY = [X Y];
r=randperm( size(XY,1) );
shuffledXY = XY(r, :);

testSet = shuffledXY(4000:5000, 1:end-1);
testSetY = shuffledXY(4000:5000, end);
X = shuffledXY(1:4000, 1:end-1);
Y = shuffledXY(1:4000, end);
y = Y;

imageWidth = 20;
imageHeight = 20;
inputLayerSize = imageWidth * imageHeight;

% 获取权重大小
weightSize = [];
neuralSize = [inputLayerSize, 15, 10];W
W = {[inputLayerSize + 1, 15], [16, 10]}; 

W{1} = randn(401, 15);
W{2} = randn(16, 10);

m = size(X, 1);
% 学习率
learningRate = 0.25;

%随机生成权重；

while loss > 5.0000e-04
    %先前传播
    [pY, A, Z] = forwardPropagation(neuralSize, X, W);

    %计算损失函数
    %loss = squareMean(pY, y)/size(y, 1)
    loss = crossEntropy(pY, y) / m
    %向后传播计算梯度
    gd = backPropagation(A, W, pY, y);
    
    %梯度下降
    W{1} = W{1} - learningRate * gd{1};
    W{2} = W{2} - learningRate * gd{2};
end

%测试
[pY, A, Z] = forwardPropagation(neuralSize, testSet, W);
[maxValues, maxIndex] = max(pY,[], 2);
accu = sum(maxIndex == testSetY) / size(testSetY, 1);
disp("准确率为：");
disp(accu);

