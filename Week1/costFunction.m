function J = costFunction(h, y)
%COSTFUNCTION 此处显示有关此函数的摘要
%   此处显示详细说明


J = (1/size(y,1))*sum((-y.*log(h) - (1-y).*log(1-h)),'all');

end

