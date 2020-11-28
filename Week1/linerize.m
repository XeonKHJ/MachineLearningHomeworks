function result = linerize(X, n)
%LINERIZE 线性化
%   此处显示详细说明

X1 = X(:,1);
X2 = X(:,2);

result = ones(size(X,1),1);
for i = 1:n
    for j = 0:i
        result(:, end+1) = (X1.^(i-j)) .* (X2.^(j));
    end
end

end

