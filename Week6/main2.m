X = [1.0;1.3;2.2;2.6;2.8;5.0;7.3;7.4;7.5;7.7;7.9]

miu1 = 6;
sigmasquare1 = 1;
pc1 = 0.5;
miu2 = 7.5;
sigmasquare2 = 1;
pc2 = 0.5;
miu = [miu1; miu2];
sigmasquare = [sigmasquare1; sigmasquare2];
pc = [pc1;pc2];

for i = 1:100
    %E步骤，计算P(Ci|Xi)
    tempmiu = repmat(miu', size(X,1), 1);
    tempX = repmat(X, 1, size(miu, 1));
    pxc = (1./sqrt(2*pi*sigmasquare))'.*exp(-(((tempX-tempmiu).^2)./(2.*(sigmasquare'))));
    pcx = (pc'.*pxc)./sum(pc'.*pxc,2);
    
    %M步骤，更新参数
    miu = (sum(pcx.*X)./sum(pcx))'
    sigmasquare = ((sum(pcx.*((repmat(X, 1, size(miu, 1))-miu').^2))./sum(pcx))')
    pc = ((1/size(X,1)) * sum(pcx))';
end