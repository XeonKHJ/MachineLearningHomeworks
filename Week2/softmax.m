function Y = softmax(X)
%SOFTMAX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
A = exp(X);

sumEA = sum(A, 2);
Y = A ./ sumEA;

end

