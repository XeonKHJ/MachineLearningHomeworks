%加载数据集
load("Datasets\spamTrain.mat");
load("Datasets\spamTest.mat")
y(y==0) = -1;
ytest(ytest==0) = -1;

lambda = 1000;
[w, b] = Pegasos(X, y, 100000, 0.1);
%[w, b] = pegasos2(X,y,lambda,[],5000,10);
trainPred = sign(Xtest*w + b);

postive = ytest(trainPred == 1);
truepostive = postive(postive == 1);
fakepostive = postive(postive==-1);

negative = ytest(trainPred == -1);
fakenegative = negative(negative==1);

precision = size(truepostive,1)/(size(truepostive,1)+size(fakepostive,1));
recall = size(truepostive,1)./(size(truepostive,1) + size(fakenegative,1));
accu = sum(sign(trainPred) == ytest) / size(ytest,1);