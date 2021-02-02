function [accuracy] = RunCNN(layers,augimdsTrain, augimdsTest, testImgs, options, folderName, CNN_parameters)
% Summary of this function goes here
%   Trains classifier
%   Outputs validation accuracy 
%   Display confusion matrix
%   Save trained network and confusion matrix inside new folder 

%   Trains classifier
trainedNetwork = trainNetwork(augimdsTrain,layers,options);
[YPred,~] = classify(trainedNetwork,augimdsTest,'minibatchsize',5);

%   Outputs validation accuracy 
accuracy = mean(YPred == testImgs.Labels);

%   Display confusion matrix
[cm, order] = confusionmat(testImgs.Labels,YPred);
fig = figure; 
plotConfMat(cm, order);

%   Create folder
mkdir('CNNs/TransferLearning', string(folderName));

%   Save trained network and confusion matrix inside new folder

%   Saving Confusion Matrix
fileName = convertStringsToChars("CNNs/TransferLearning" + "/" + string(folderName) + "/" + string(folderName) + "_cm");
saveas(fig, string(fileName) + '.png');

%   Saving trained network
fileName = convertStringsToChars("CNNs/TransferLearning" + "/" + string(folderName) + "/" + string(folderName) + "_TrainedNetwork");
save(fileName + ".mat", "trainedNetwork");

%   Save accuracy
fileName = convertStringsToChars("CNNs/TransferLearning" + "/" + string(folderName) + "/" + string(folderName) + "_accuracy");
save(fileName + ".mat", "accuracy");

% %   Append to CSV file 
% CNN_parameters = [CNN_parameters(1) , {accuracy} , CNN_parameters(2:end)];
% CNN_parameters = cell2table(CNN_parameters);
% masterTable = readtable('CNNs/Datasheets/Test_Results.csv','ReadVariableNames',false);
% mergedTable = [masterTable; CNN_parameters];
% writetable(mergedTable, 'CNNs/Datasheets/Test_Results.csv', 'WriteVariableNames', false);

end

