function gradients = backPropagation(A,W, pY, y)
%BACKWARDPRO ���򴫲�
%   �˴���ʾ��ϸ˵��

%��ȡW
w1 = W{1};
w2 = W{2};

%��Y
Y = zeros(size(pY,1), 10);

for row = 1:size(pY,1)
    Y(row, y(row)) = 1;
end

% ������������
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

