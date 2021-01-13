[X, y] = readData();

%照片大小112*92

dictSize = [40, 30];
dataSize = 40;
testSet = X(100:200, :);
%X = X(1:dataSize,:);

%居中
meanX = mean(X, 1);
Xcenter = X - meanX;

%计算协方差矩阵
covX = cov(Xcenter);

%奇异值分解
[U, S, V] = svd(covX);

U = U(:, 1:400);
Z = X*U;
XRecover = Z*U' + meanX;