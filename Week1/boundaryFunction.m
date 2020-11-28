function b = boundaryFunction(X, Theta)
%BOUNDARYFUNCTION 此处显示有关此函数的摘要
%   X为m*n的矩阵，Theta为n*1的矩阵

b = X*Theta;
b = 1./(1+exp(-1*b));
end

