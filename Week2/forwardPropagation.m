function [pY, A, Z] = forwardPropagation(neuralNetworkSize,inputs, weights)
%FORWARDPROPAGATION 向前传播
%   A是返回的激活值

% 先拿出有几层
layerNum = size(neuralNetworkSize);

%weightSize = zeros([2, layerNum - 1]);

% 算了写死算了好麻烦
%weightSize = {[401 16], [15 10]};


W1 = weights{1};
W2 = weights{2};

%填1
tempinputs = [ones([size(inputs, 1), 1]), inputs];
Z1 = tempinputs * W1;

A2 = relu(Z1);

%填1
tempA2 = [ones([size(A2,1), 1]), A2];
Z2 = tempA2 * W2;

A3 = softmax(Z2);

pY = A3;
A = {inputs, A2, A3};
Z = {Z1, Z2};
end

