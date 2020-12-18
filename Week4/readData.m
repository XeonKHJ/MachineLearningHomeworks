function [X, y] = readData()
%READDATA �����ݼ��ж�ȡ����
%   �˴���ʾ��ϸ˵��

X = zeros(400, 10304);
y = zeros(400, 1);
for i = 1 : 40
    numberChar = num2str(i);
    folderName = strcat('s', numberChar);
    pathName = strcat('dataset/',folderName);
    pathName = strcat(pathName, '/');
    % ���ļ����ж�ȡ����
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

