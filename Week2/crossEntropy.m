function H = crossEntropy(pY, y)
% 此处显示有关此函数的摘要
%   pY为预测的Y
%   Y为真实的Y

%造Y
Y = zeros(size(pY,1), 10);

for row = 1:size(pY,1)
    Y(row, y(row)) = 1;
end

H = (-1) * sum(Y .* log(pY), 'all');

end

