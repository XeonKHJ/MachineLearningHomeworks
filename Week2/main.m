loss = Inf;

% 拿训练集
data = load("trainingdata.data");

% 拿测试机
XY = data;
r=randperm( size(XY,1) );
shuffledXY = XY(r, :);

testSet = shuffledXY(40000:50000, 1:end-1);
testSetY = shuffledXY(40000:50000, end);
X = shuffledXY(1:40000, 1:end-1);
Y = int32(shuffledXY(1:40000, end)); 
y = Y;

imageWidth = 28;
imageHeight = 28;
inputLayerSize = imageWidth * imageHeight;

% 获取权重大小
weightSize = [];
neuralSize = [inputLayerSize, 15, 10];
W = {[inputLayerSize + 1, 15], [16, 10]}; 

W{1} = randn(inputLayerSize + 1, 15);
W{2} = randn(16, 10);

m = size(X, 1);
% 学习率
learningRate = 0.1;

%随机生成权重；
epoch = 0;

while loss > 5.0000e-04
    epoch = epoch + 1;
    %先前传播
    [pY, A, Z] = forwardPropagation(neuralSize, X, W);

    %计算损失函数
    %loss = squareMean(pY, y)/size(y, 1)
    loss = crossEntropy(pY, y) / m
    %向后传播计算梯度
    gd = backPropagation(A, W, pY, y);
    
    %梯度下降
    W{1} = W{1} + learningRate * gd{1};
    W{2} = W{2} + learningRate * gd{2};
    
    if (mod(epoch, 500) == 0)
        %测试
        [pY, A, Z] = forwardPropagation(neuralSize, testSet, W);
        [maxValues, maxIndex] = max(pY,[], 2);
        accu = sum(maxIndex == (testSetY + 1)) / size(testSetY, 1);
        disp("损失为:");
        disp(loss);
        disp("准确率为：");
        disp(accu);
    end
end



