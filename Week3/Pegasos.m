function [w, b] = Pegasos(X, y, times, lambda)
%UNTITLED 倍伽索斯算法
%   times为迭代次数

%初始化w，这边w就包含b了
w = randn(size(X,2),1);
b = rand();
t = 0;
for iter = 1:times
    %随机挑选第1个样本进行更新
    i = randi(size(X,1));
    t = t+1;
    nt = 1/(lambda*t);
    
    if(y(i)*(X(i,:)*w+b) < 1)
        result = [w;b] - nt * [lambda*w - y(i)*(X(i,:)'); -y(i)];
        w = result(1:end-1);
        b = result(end);
    else
        result = [w;b] - nt * [lambda*w; 0];
        w = result(1:end-1);
        b = result(end);
    end
    
    if mod(iter, 10000) == 0
        trainPred = X*w + b;
        accu = (sum(sign(trainPred) == y)) / size(X, 1)
    end
end

