function b = boundaryFunction(X, Theta)
%BOUNDARYFUNCTION �˴���ʾ�йش˺�����ժҪ
%   XΪm*n�ľ���ThetaΪn*1�ľ���

b = X*Theta;
b = 1./(1+exp(-1*b));
end

