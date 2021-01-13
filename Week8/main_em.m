[X, y] = readData();

%照片大小112*92

dictSize = [40, 30];
dataSize = 40;
testSet = X(100:200, :);
%X = X(1:dataSize,:);

%要提取维度k
k = 400;

%居中
meanX = mean(X, 1);
Xcenter = X - meanX;

%计算协方差矩阵
%covX = cov(Xcenter);
W = randn(size(X, 2), k);

while true
%E步
Z = (W'*W)\W'*(Xcenter');

%M步
W = Xcenter'*Z'/(Z*Z');
end

Xrec = W*Z;
XRecover = Z*U' + meanX;