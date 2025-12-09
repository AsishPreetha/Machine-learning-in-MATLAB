clc;
clear all;
close all;
warning off;
data = dataset('xlsfile', 'trainingset.xlsx');
X = double(data(:,1:13));
Y = double(data(:,14));
data1 = dataset('xlsfile', 'testingset.xlsx');
X1 = double(data1(:,1:13));
Y1 = double(data1(:,14));
xdata = X;
group = Y;
% test set
u=X1;
v=Y1;
TrainingSet=xdata;
TestSet=u;
GroupTrain=group;
g2 = multisvm(TrainingSet, GroupTrain, TestSet); 
[r c]=size(X);
g1=v;
confMat= confusionmat(g1,g2);
disp('confusion matrix:')
disp(confMat)
conf=sum(g2==g1)/length(g2);
disp(['accuracy = ',num2str(conf*100),'%'])
acc=conf*100;
acc;