function gradients = backPropagation(A,W, pY, y)
%BACKWARDPRO 反向传播
%   此处显示详细说明

%提取W
w1 = W{1};
w2 = W{2};

%造Y
Y = zeros(size(pY,1), 10);

for row = 1:size(pY,1)
    Y(row, y(row)) = 1;
end

% 计算输出层误差
% BP1

tempc = crossEntropy(pY, y);
lossL = (Y./(pY*log(10))).*(tempc .*(tempc - 1));

% BP2
AbiggerThan1 = A>1;
Loss2 = (w2' * lossL) .* AbiggerThan1(:,2);
Loss1 = (w1' * loss2) .* AbiggerThan1(:,1);

%BP3

%BP4
gradients = zeros(size(W));
gradients = A;

end

