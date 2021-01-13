[X, y] = readData();

%照片大小112*92
dataSize = 40;
testSet = X(100:200, :);
%X = X(1:dataSize,:);
    
%要缩小的维度
k = 8;

%居中
meanX = mean(X, 1);
Xcenter = X - meanX;

%计算协方差矩阵
covX = cov(Xcenter);

%奇异值分解
%[U, S, V] = svd(covX);
[V, D] = eig(covX);

D = diag(D);
[D, order] = sort(D, 'descend');
V = V(:,order);
D = diag(D);

U = V(:, 1:k);
subD = D(1:k, 1:k);

sigmasquare = 1/(size(X, 2) - k) * (sum(D, 'all') - sum(subD, 'all'));
W = U*((subD - sigmasquare*eye(k))^(1/2));

Z = (W' * W + sigmasquare * eye(k)) \ W' * Xcenter';
Xrec =  (W*Z)' + meanX;