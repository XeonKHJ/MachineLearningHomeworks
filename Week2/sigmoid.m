function g = sigmoid(z)
%SIGMOID ¼ÆËãsigmoidº¯Êýs\
%   J = SIGMOID(z) computes the sigmoid of z.

g = 1.0 ./ (1.0 + exp(-z));
end
