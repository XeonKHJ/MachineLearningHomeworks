function J = costFunction(h, y)
%COSTFUNCTION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


J = (1/size(y,1))*sum((-y.*log(h) - (1-y).*log(1-h)),'all');

end

