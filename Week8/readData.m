function [X, y] = readData()
%READDATA 从数据集中读取数据
%   此处显示详细说明

X = zeros(400, 10304);
y = zeros(400, 1);
for i = 1 : 40
    numberChar = num2str(i);
    folderName = strcat('s', numberChar);
    pathName = strcat('dataset/',folderName);
    pathName = strcat(pathName, '/');
    % 从文件夹中读取数据
    for j = 1:10
        fileName = strcat(num2str(j), '.pgm');
        x = im2double(imread(strcat(pathName, fileName)));
        x = reshape(x, 1, 10304);
        
        index = (i-1)*10 + j;
        X(index, :) = x;
        y(index) = i;
    end
end

end

