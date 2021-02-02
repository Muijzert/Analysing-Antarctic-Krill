% % clear;
% % % PARAMETERS 
% % loadFile = 'upSampledD';
% % folderName = 'vgg16_UD_0';
% % miniBatchSize = 10;
% % %
% % % Loads datasets
% % load (strcat('train',loadFile));
% % load (strcat('val',loadFile));
% % load (strcat('test',loadFile));
% % 
% % % Loads CCN
% % layers = [
% %     imageInputLayer([224 224 3],"Name","imageinput")
% %     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu1_1")
% %     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu1_2")
% %     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
% %     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu2_1")
% %     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu2_2")
% %     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
% %     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_1")
% %     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_2")
% %     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_3")
% %     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
% %     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_1")
% %     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_2")
% %     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_3")
% %     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
% %     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_1")
% %     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_2")
% %     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_3")
% %     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
% %     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
% %     reluLayer("Name","relu6")
% %     dropoutLayer(0.5,"Name","drop6")
% %     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
% %     reluLayer("Name","relu7")
% %     dropoutLayer(0.5,"Name","drop7")
% %     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
% %     softmaxLayer("Name","prob")
% %     classificationLayer("Name","output")];
% % 
% % 
% % inputSize = layers(1).InputSize;
% % 
% % % Augmenter 
% % imageAugmenter = imageDataAugmenter( ...
% %     'RandXReflection',false);
% % augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
% %     'DataAugmentation',imageAugmenter);
% % augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% % augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% % 
% % % % Augments Training images before being used in the classifier
% % % trainImgs.ReadSize = numpartitions(trainImgs);
% % % trainImgs.ReadFcn = @ReadFunctionAugment;
% % % read(trainImgs);
% % 
% % % Options
% % valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% % options = trainingOptions('sgdm', ...
% %     'MiniBatchSize',miniBatchSize, ...
% %     'MaxEpochs',6, ...
% %     'InitialLearnRate',2e-4, ...
% %     'Shuffle','every-epoch', ...
% %     'ValidationData',augimdsValidation, ...
% %     'ValidationFrequency',valFrequency, ...
% %     'Verbose',false, ...
% %     'Plots','training-progress');
% % %    'ValidationPatience', 1, ...
% % 
% % % Run tests
% % vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 1
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment7';
% folderName = 'vgg16_UD_1';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXTranslation',[-5 5]);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 2
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment6';
% folderName = 'vgg16_UD_2';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',false);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
%  
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 3
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment3';
% folderName = 'vgg16_UD_3';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',false);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 4
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment4';
% folderName = 'vgg16_UD_4';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',false);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 5
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment4';
% folderName = 'vgg16_UD_5';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXTranslation',[-5 5]);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 6
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment8';
% folderName = 'vgg16_UD_6';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',false);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 7
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment5';
% folderName = 'vgg16_UD_7';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',false);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 8
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment6';
% folderName = 'vgg16_UD_8';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXTranslation',[-5 5]);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 9
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment3';
% folderName = 'vgg16_UD_9';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXTranslation',[-5 5]);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% % %% 10
% % clear;
% % % PARAMETERS 
% % loadFile = 'Augment7';
% % folderName = 'vgg16_UD_10';
% % miniBatchSize = 10;
% % %
% % % Loads datasets
% % load (strcat('train',loadFile));
% % load (strcat('val',loadFile));
% % load (strcat('test',loadFile));
% % 
% % % Loads CCN
% % layers = [
% %     imageInputLayer([224 224 3],"Name","imageinput")
% %     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu1_1")
% %     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu1_2")
% %     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
% %     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu2_1")
% %     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu2_2")
% %     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
% %     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_1")
% %     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_2")
% %     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu3_3")
% %     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
% %     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_1")
% %     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_2")
% %     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu4_3")
% %     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
% %     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_1")
% %     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_2")
% %     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
% %     reluLayer("Name","relu5_3")
% %     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
% %     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
% %     reluLayer("Name","relu6")
% %     dropoutLayer(0.5,"Name","drop6")
% %     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
% %     reluLayer("Name","relu7")
% %     dropoutLayer(0.5,"Name","drop7")
% %     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
% %     softmaxLayer("Name","prob")
% %     classificationLayer("Name","output")];
% % 
% % 
% % inputSize = layers(1).InputSize;
% % 
% % % Augmenter 
% % imageAugmenter = imageDataAugmenter( ...
% %     'RandXReflection',false);
% % augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
% %     'DataAugmentation',imageAugmenter);
% % augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% % augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% % 
% % % % Augments Training images before being used in the classifier
% % % trainImgs.ReadSize = numpartitions(trainImgs);
% % % trainImgs.ReadFcn = @ReadFunctionAugment;
% % % read(trainImgs);
% % 
% % % Options
% % valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% % options = trainingOptions('sgdm', ...
% %     'MiniBatchSize',miniBatchSize, ...
% %     'MaxEpochs',6, ...
% %     'InitialLearnRate',2e-4, ...
% %     'Shuffle','every-epoch', ...
% %     'ValidationData',augimdsValidation, ...
% %     'ValidationFrequency',valFrequency, ...
% %     'Verbose',false, ...
% %     'Plots','training-progress');
% % %    'ValidationPatience', 1, ...
% % 
% % % Run tests
% % vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
% 
% %% 11
% clear;
% % PARAMETERS 
% loadFile = 'D_Augment2';
% folderName = 'vgg16_UD_11';
% miniBatchSize = 10;
% %
% % Loads datasets
% load (strcat('train',loadFile));
% load (strcat('val',loadFile));
% load (strcat('test',loadFile));
% 
% % Loads CCN
% layers = [
%     imageInputLayer([224 224 3],"Name","imageinput")
%     convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_1")
%     convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu1_2")
%     maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
%     convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_1")
%     convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu2_2")
%     maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
%     convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_1")
%     convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_2")
%     convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu3_3")
%     maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_1")
%     convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_2")
%     convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu4_3")
%     maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
%     convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_1")
%     convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_2")
%     convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
%     reluLayer("Name","relu5_3")
%     maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
%     fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
%     reluLayer("Name","relu6")
%     dropoutLayer(0.5,"Name","drop6")
%     fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
%     reluLayer("Name","relu7")
%     dropoutLayer(0.5,"Name","drop7")
%     fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
%     softmaxLayer("Name","prob")
%     classificationLayer("Name","output")];
% 
% 
% inputSize = layers(1).InputSize;
% 
% % Augmenter 
% imageAugmenter = imageDataAugmenter( ...
%     'RandXTranslation',[-5 5]);
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
%     'DataAugmentation',imageAugmenter);
% augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);
% 
% % % Augments Training images before being used in the classifier
% % trainImgs.ReadSize = numpartitions(trainImgs);
% % trainImgs.ReadFcn = @ReadFunctionAugment;
% % read(trainImgs);
% 
% % Options
% valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
% options = trainingOptions('sgdm', ...
%     'MiniBatchSize',miniBatchSize, ...
%     'MaxEpochs',6, ...
%     'InitialLearnRate',2e-4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',augimdsValidation, ...
%     'ValidationFrequency',valFrequency, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% %    'ValidationPatience', 1, ...
% 
% % Run tests
% vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});

%% 12
clear;
% PARAMETERS 
loadFile = 'D_Augment7';
folderName = 'vgg16_UD_12';
miniBatchSize = 10;

% Loads datasets
load (strcat('train',loadFile));
load (strcat('val',loadFile));
load (strcat('test',loadFile));

% Loads CCN
layers = [
    imageInputLayer([224 224 3],"Name","imageinput")
    convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu1_1")
    convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu1_2")
    maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
    convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu2_1")
    convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu2_2")
    maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
    convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_1")
    convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_2")
    convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_3")
    maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
    convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_1")
    convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_2")
    convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_3")
    maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
    convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_1")
    convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_2")
    convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_3")
    maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
    fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
    reluLayer("Name","relu6")
    dropoutLayer(0.5,"Name","drop6")
    fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
    reluLayer("Name","relu7")
    dropoutLayer(0.5,"Name","drop7")
    fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
    softmaxLayer("Name","prob")
    classificationLayer("Name","output")];


inputSize = layers(1).InputSize;

% Augmenter 
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',false);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImgs, ...
    'DataAugmentation',imageAugmenter);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),valImgs);
augimdsTest = augmentedImageDatastore(inputSize(1:2),testImgs);

% Augments Training images before being used in the classifier
trainImgs.ReadSize = numpartitions(trainImgs);
trainImgs.ReadFcn = @ReadFunctionAugment;
read(trainImgs);

% Options
valFrequency = floor(numel(augimdsTrain.Files)/miniBatchSize);
options = trainingOptions('sgdm', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',6, ...
    'InitialLearnRate',2e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',valFrequency, ...
    'Verbose',false, ...
    'Plots','training-progress');
   'ValidationPatience', 1, ...

% Run tests
vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});

%% 13
clear;
% PARAMETERS 
loadFile = 'D_Augment1';
folderName = 'vgg16_UD_13';
miniBatchSize = 10;
%
% Loads datasets
load (strcat('train',loadFile));
load (strcat('val',loadFile));
load (strcat('test',loadFile));

% Loads CCN
layers = [
    imageInputLayer([224 224 3],"Name","imageinput")
    convolution2dLayer([3 3],64,"Name","conv1_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu1_1")
    convolution2dLayer([3 3],64,"Name","conv1_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu1_2")
    maxPooling2dLayer([2 2],"Name","pool1","Stride",[2 2])
    convolution2dLayer([3 3],128,"Name","conv2_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu2_1")
    convolution2dLayer([3 3],128,"Name","conv2_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu2_2")
    maxPooling2dLayer([2 2],"Name","pool2","Stride",[2 2])
    convolution2dLayer([3 3],256,"Name","conv3_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_1")
    convolution2dLayer([3 3],256,"Name","conv3_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_2")
    convolution2dLayer([3 3],256,"Name","conv3_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu3_3")
    maxPooling2dLayer([2 2],"Name","pool3","Stride",[2 2])
    convolution2dLayer([3 3],512,"Name","conv4_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_1")
    convolution2dLayer([3 3],512,"Name","conv4_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_2")
    convolution2dLayer([3 3],512,"Name","conv4_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu4_3")
    maxPooling2dLayer([2 2],"Name","pool4","Stride",[2 2])
    convolution2dLayer([3 3],512,"Name","conv5_1","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_1")
    convolution2dLayer([3 3],512,"Name","conv5_2","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_2")
    convolution2dLayer([3 3],512,"Name","conv5_3","Padding",[1 1 1 1],"WeightL2Factor",0)
    reluLayer("Name","relu5_3")
    maxPooling2dLayer([2 2],"Name","pool5","Stride",[2 2])
    fullyConnectedLayer(4096,"Name","fc_1","WeightL2Factor",0)
    reluLayer("Name","relu6")
    dropoutLayer(0.5,"Name","drop6")
    fullyConnectedLayer(4096,"Name","fc_2","WeightL2Factor",0)
    reluLayer("Name","relu7")
    dropoutLayer(0.5,"Name","drop7")
    fullyConnectedLayer(11,"Name","fc8","WeightL2Factor",0)
    softmaxLayer("Name","prob")
    classificationLayer("Name","output")];


inputSize = layers(1).InputSize;

% Augmenter 
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',false);
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
    'MaxEpochs',6, ...
    'InitialLearnRate',2e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',valFrequency, ...
    'Verbose',false, ...
    'Plots','training-progress');
%    'ValidationPatience', 1, ...

% Run tests
vgg16_accuracy = RunCNN(layers, augimdsTrain, augimdsTest, testImgs, options, folderName,{folderName, false, false, false});
