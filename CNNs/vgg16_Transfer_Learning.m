clear;
%% PARAMETERS 
loadFile = 'RandomErase';
folderName = 'TransferLearning_vgg16_L_2';
miniBatchSize = 10;
%%
% Loads datasets
load (strcat('train',loadFile));
load (strcat('val',loadFile));
load (strcat('test',loadFile));

% Loads CCN
net = vgg19;
inputSize = net.Layers(1).InputSize;
layersTransfer = net.Layers(1:end-3);
numClasses = numel(categories(trainImgs.Labels));
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',3,'BiasLearnRateFactor',3)
    softmaxLayer
    classificationLayer];

% % Changing learning rate for convoluational layers
% for convNumb = [4 7 9 12 14 16 18 21 23 25 27 30 32 34 36]
%     tempConv = net.Layers(convNumb);
%     tempConv.WeightLearnRateFactor = 0;
%     tempConv.WeightL2Factor = 0;
%     tempConv.BiasLearnRateFactor = 0;
%     tempConv.BiasL2Factor = 0; 
%     layers(convNumb) = tempConv;
% end

% Augmenter 
imageAugmenter = imageDataAugmenter( ...
    'RandXTranslation',[-10 10]);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
    'DataAugmentation',imageAugmenter);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);

% % Augments Training images before being used in the classifier
% trainImgs.ReadSize = numpartitions(trainImgs);
% trainImgs.ReadFcn = @ReadFunctionAugment;
% read(trainImgs);

% Options
valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',2, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',valFrequency, ...
    'Verbose',false, ...
    'Plots','training-progress');
%    'ValidationPatience', 1, ...

% Run tests
vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});