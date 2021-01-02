X = [0.697 0.460;
     0.774 0.376;
     0.634 0.264;
     0.608 0.318;
     0.556 0.215;
     0.403 0.237;
     0.481 0.149;
     0.437 0.211;
     0.666 0.091;
     0.243 0.267;
     0.245 0.057;
     0.343 0.099;
     0.639 0.161;
     0.657 0.198;
     0.360 0.370;
     0.593 0.042;
     0.719 0.103];
y = [1;1;1;1;1;1;1;1;0;0;0;0;0;0;0;0;0];

X1 = X(y == 1, :);
X2 = X(y == 0, :);
miu1 = sum(X1) ./ size(X1, 1);
miu2 = sum(X2) ./ size(X2, 1);
sigmasquare1 = (1/(size(X1, 1)))*sum((X1 - miu1).^2);
sigmasquare2 = (1/(size(X2, 1)))*sum((X2 - miu2).^2);
miu = [miu1;miu2];
sigmasquare = [sigmasquare1; sigmasquare2];

pc1 = size(X1, 1) / size(X,1);
pc2 = size(X2, 1) / size(X,1);

predX = [0.5 0.3];
covM = cov(X);
pred1 = (1./(((2*pi).^(2/2))*sqrt(det(covM)))) .* exp(-(1/2) * (predX - miu1)/covM * (predX-miu1)');
pred2 = (1./(((2*pi).^(2/2))*sqrt(det(covM)))) .* exp(-(1/2) * (predX - miu2)/covM * (predX-miu2)');
pc = [pc1; pc2];
result = sum(pred .* pc, 2);

