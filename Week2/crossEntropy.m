function H = crossEntropy(pY, y)
% �˴���ʾ�йش˺�����ժҪ
%   pYΪԤ���Y
%   YΪ��ʵ��Y

%��Y
Y = zeros(size(pY,1), 10);

for row = 1:size(pY,1)
    Y(row, y(row)) = 1;
end

H = (-1) * sum(Y .* log(pY), 'all');

end

