function g = sigmoid(z)
%SIGMOID ����sigmoid����s\
%   J = SIGMOID(z) computes the sigmoid of z.

g = 1.0 ./ (1.0 + exp(-z));
end
