function [pY, A] = forwardPropagation(neuralNetworkSize,inputs, weights)
%FORWARDPROPAGATION 向前传播
%   A是返回的激活值

% 先拿出有几层
layerNum = size(neuralNetworkSize);
weightSize = zeros([2, layerNum - 1]);

% 算了写死算了好麻烦
weightSize = {[401 16], [15 10]};


W1 = weights{1};
W2 = weights{2};

%填1
inputs = [ones([size(inputs, 1), 1]), inputs];

Z2 = inputs * W1;
A2 = relu(Z2);

%填1
A2 = [ones([size(A2,1), 1]), A2];

Z3 = A2 * W2
A3 = relu(Z3);

pY = softmax(A3);
A = {inputs, A2, A3};

end

