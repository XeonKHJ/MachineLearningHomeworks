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
tempc = softmax(pY);
LossL = (Y./(pY*log(10))).*(tempc .*(tempc - 1));

%反向传播
% BP2
A2biggerThan0 = A{2} >0;
A1biggerThen0 = A{1} > 0;
Loss2 = ( LossL * w2') .* A2biggerThan0(:,2);
Loss1 = ( Loss2(:,2:end) * w1' ) .* A1biggerThen0(:,1);

%计算梯度
%BP3
gradients2 = A{2}' * LossL;
gradients1 = A{1}' * Loss2(:,2:end);

gradients = {gradients1, gradients2};

end

