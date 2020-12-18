[X, y] = readData();

dictSize = [40, 30];
dataSize = 1;
X = X(1,:);
% 在这个数据集里p是112*92=10304，要提取的特征数为k，肯定要比10304小。
p = 10304;

% 随机初始化字典B，B的大小为[p, k]，k为字典的词汇量。
k  = 40;
B = randn(p, k);
A = randn(k, dataSize);
lambda = 1;
count = 1;
while true
    %通过坐标下降法，固定B，求A
    % 构建A和B矩阵快速求解应该可以。
    Alk = zeros(size(dataSize, k));
    Blk = repmat( sum(B.^2) , dataSize , 1 );


    %在onenote笔记里，i就是标志k，艹自己给自己写乱了。
    for l = 1 : dataSize
        for i = 1 : k
            alpha = A(:,l);
            alpha(i) = 0;
            Alk(l, i) = sum((B * alpha - B(:,i)).*B(:,i));
        end
    end

    %求解A
    A = zeros(size(A))';
    condition1 = Alk > (lambda / 2);
    result1 = 1./Blk .* (Alk - (lambda / 2));
    A(condition1) = result1(condition1);
    condition2 = Alk < ((-lambda) / 2);
    result2 = -(1./Blk .* (Alk + (lambda / 2)));
    A(condition2) = result1(condition2);
    A = A';

    %固定A，求解B
    B = ((X')*(A'))/(A*A' ); 
    
    L = (sum((X'-(B*A)).^2, 'all') + lambda * sum(abs(A), 'all'))/(10304 * dataSize) 
    count = count+1;
end