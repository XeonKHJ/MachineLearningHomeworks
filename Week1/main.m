clear
clc

%读取文件
data = load('ex2data2.txt');
X = data(:, 1:2);
XBackup = X;
Y = data(:, 3);

%画图
figure; hold on;
postive = find(Y==1);
negtive = find(Y == 0);
plot(X(postive, 1), X(postive, 2), 'k+', 'LineWidth', 1);
plot(X(negtive, 1), X(negtive, 2), 'ko');

X = linerize(X, 6);
Theta = ones(size(X,2), 1);

%Theta = zeros(size(X,2),1);


h = boundaryFunction(X, Theta);

J = costFunction(h, Y);

alpha = 0.5; %学习率
oldJ = 1;
while J > 0.0000000001
    Theta = Theta - alpha * (1/size(X,1)) *  (X' * (h-Y));
    h = boundaryFunction(X, Theta);
    oldJ = J;
    J = costFunction(h, Y);
    if((oldJ - J) < 0.0000001)
        break
    end
end

a = linspace(min(XBackup(:,1)), max(XBackup(:,1)), 50);
b = linspace(min(XBackup(:,2)), max(XBackup(:,2)), 50);

    %a = linspace(-1, 1.5, 50);
    %b = linspace(-1, 1.5, 50);

c = zeros(50, 50);
for i = 1:50
    for j = 1:50
        c(i, j) = linerize([a(i),b(j)], 6)*Theta;
    end
end


contour(a, b, c, [0,0]);


