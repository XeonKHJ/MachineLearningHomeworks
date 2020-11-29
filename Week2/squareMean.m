function loss = squareMean(pY, y)

%造Y
Y = zeros(size(pY,1), 10);

for row = 1:size(pY,1)
    Y(row, y(row)) = 1;
end


loss = sum((1/2) * ((pY-Y).^2), 'all');

end

