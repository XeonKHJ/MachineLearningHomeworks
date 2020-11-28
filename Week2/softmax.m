function Y = softmax(X)
%SOFTMAX 此处显示有关此函数的摘要
%   此处显示详细说明
A = exp(X);

sumEA = sum(A, 2);
Y = A ./ sumEA;

end

