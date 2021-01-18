[X, y] = readData();

k = 8;
%照片大小112*92

dataSize = 40;
testSet = X(100:200, :);
%X = X(1:dataSize,:);

%居中
meanX = mean(X, 1);
Xcenter = X - meanX;

%奇异值分解
[U, S, V] = svd(Xcenter');

U = U(:, 1:k);
Z = Xcenter*U;
XRecover = Z*U' + meanX;



