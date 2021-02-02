%% Parameters 

folderName = 'upSampledD';
startFolder = 'SortedD';
imageView = 'Dorsal';
%% Creates imagedatabase with classes labeled

folderedImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(startFolder),'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%% Make folder directory 

mkdir('Filtered_Krill_Data\'+ string(imageView) + '\', string(folderName));
folderLocation = strcat('Filtered_Krill_Data\'+ string(imageView) + '\', string(folderName));

% List subset folders and class folders
subsets = {'Train', 'Validation', 'Test'};
categories = unique(folderedImgs.Labels);

% Makes folders for post-images
for s = 1 : length(subsets)
    % Make sub folders
    mkdir(folderLocation, subsets{s});

    for cl = 1 : length(categories)
        % Make class folder
        mkdir(strcat(folderLocation,'/',subsets{s}), string(categories(cl)));
    end
end

% Adds new folder and sub folders to path
addpath (genpath(folderLocation));
%%  Counts total amount of samples in each class

T = countEachLabel(folderedImgs);

% Shuffles images
rng(0)
folderedImgs = shuffle(folderedImgs);

% Splits data into training and testing data
[imdsTrain,imdsVal, imdsTest] = splitEachLabel(folderedImgs,0.7,0.15,0.15);
trainTotal = countEachLabel(imdsTrain);
valTotal = countEachLabel(imdsVal);
testTotal = countEachLabel(imdsTest);

trainNumImagesToExtract = max(trainTotal{:,2});
testNumImagesToExtract = max(testTotal{:,2});
valNumImagesToExtract = max(valTotal{:,2});

%% Training images duplication
for i = 1 : height(trainTotal)
    classIndex = find(contains(cellstr(imdsTrain.Labels), cellstr(trainTotal{i,1})));
    randomClass1Indexes = randsample(trainTotal{i,2}, trainNumImagesToExtract, true);
       
    for j = 1 :  trainNumImagesToExtract
        
        img = imread(imdsTrain.Files{classIndex(randomClass1Indexes(j))});
        fileLocation = imdsTrain.Files{classIndex(randomClass1Indexes(j))};
        
        folderPath = split(fileLocation,"\");
    
        fileName = convertStringsToChars('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Train\' + string(trainTotal{i,1}) + '\' + string(folderPath{end}) + '_DUP_' + string(j) + '.jpg');
        
        imwrite(img, fileName);
    end
end

%% Testing images
for i = 1 : height(testTotal)
    classIndex = find(contains(cellstr(imdsTest.Labels), cellstr(testTotal{i,1})));
    randomClass1Indexes = randsample(testTotal{i,2}, testNumImagesToExtract, true);
       
    for j = 1 : testNumImagesToExtract 
        img = imread(imdsTest.Files{classIndex(randomClass1Indexes(j))});
        fileLocation = imdsTest.Files{classIndex(randomClass1Indexes(j))};
        
        folderPath = split(fileLocation,"\");
    
        fileName = convertStringsToChars('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Test\' + string(testTotal{i,1}) + '\' + string(folderPath{end}) + '_DUP_' + string(j) + '.jpg');
        
        imwrite(img, fileName);

    end
end

%% Validation images
for i = 1 : height(valTotal)
    classIndex = find(contains(cellstr(imdsVal.Labels), cellstr(valTotal{i,1})));
    randomClass1Indexes = randsample(valTotal{i,2}, valNumImagesToExtract, true);
       
    for j = 1 : valNumImagesToExtract
        
        img = imread(imdsVal.Files{classIndex(randomClass1Indexes(j))});
        fileLocation = imdsVal.Files{classIndex(randomClass1Indexes(j))};
        
        folderPath = split(fileLocation,"\");
    
        fileName = convertStringsToChars('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Validation\' + string(valTotal{i,1}) + '\' + string(folderPath{end}) + '_DUP_' + string(j) + '.jpg');
        
        imwrite(img, fileName);
    end
end

%% Save imageDatastores
trainImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Train\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

testImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Test\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

valImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Validation\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');


save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'train' + string(folderName),'trainImgs');
save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'test' + string(folderName),'testImgs');
save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'val' + string(folderName),'valImgs');