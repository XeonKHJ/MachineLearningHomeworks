function Y = relu(X)
%RELU �˴���ʾ�йش˺�����ժҪ
%   X��Y��Ϊ���󰡣�

Y = zeros(size(X));

A = X > 0;
Y(A) =X(A);

end

