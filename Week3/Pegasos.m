function [w, b] = Pegasos(X, y, times, lambda)
%UNTITLED ��٤��˹�㷨
%   timesΪ��������

%��ʼ��w�����w�Ͱ���b��
w = randn(size(X,2),1);
b = rand();
t = 0;
for iter = 1:times
    %�����ѡ��1���������и���
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

