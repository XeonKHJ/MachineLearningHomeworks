function Y = relu(X)
%RELU 此处显示有关此函数的摘要
%   X和Y皆为矩阵啊；

Y = zeros(size(X));

A = X > 0;
Y(A) =X(A);

end

