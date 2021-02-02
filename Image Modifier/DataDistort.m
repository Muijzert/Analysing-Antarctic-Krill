% Load imageDatastore
load trainRawSorted;
load testRawSorted;
load valRawSorted;

% PARAMETERS
folderName = 'Gaussian0.4RandSorted';
maxHeight = 488;
maxWidth = 1632;
maxRandom = 0;
totalHeightWrong = 0;
totalWidthWrong = 0;
randVariance = 0.4;

% Make folder directory 
mkdir('Filtered_Krill_Data/Lateral', string(folderName));
folderLocation = strcat('Filtered_Krill_Data/Lateral/', string(folderName));

% List subset folders and class folders
subsets = {'Train', 'Validation', 'Test'};
categories = unique(trainImgs.Labels);

% Makes folders for post-images
for s = 1 : length(subsets)
    % Make sub folders
    mkdir(folderLocation, subsets{s});

    for cl = 1 : length(categories)
        % Make class folder
        mkdir(strcat(folderLocation,'/',subsets{s}), string(categories(cl)));
    end
end


% mkdir(folderLocation, 'Train');
% mkdir(folderLocation, 'Validation');
% mkdir(folderLocation, 'Test');



% Distort training images
for i = 1 : length(trainImgs.Labels)
    % Load image
    img = imread(trainImgs.Files{i});
    [c,r,~] = size(img);
    
    % Gaussian distort
    img = im2double(img);
    sigma = std(img(:));
    
    % Makes random variance of noice 
    r = -randVariance + (randVariance+randVariance)*rand;
%     img = imnoise(img,'gaussian', (sigma + r)^ 1/2);
%     img = imnoise(img,'gaussian', (sigma)^ 1/2);
    img = imnoise(img,'gaussian', r);
    
    
    % Colouring
    RGB = randi([1 3], 1,1);
    ratio = 0.8 + rand(1,1)*(1.2-0.8);
    img(:,:,RGB) =  img(:,:,RGB)* ratio;
    

    % Padding 
    img = PaddingVariance(img, maxRandom, maxHeight, maxWidth);
    
    % Save images in new distorted folder
    fileLocation = trainImgs.Files{i};
    folderPath = split(fileLocation,"\");
    fileName = convertStringsToChars('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Train\' + string(trainImgs.Labels(i,1)) + '\' + string(folderPath{end}));
    imwrite(img, fileName);
    
end

% Distort testing images
parfor i = 1 : length(testImgs.Labels)
    
    % Load image
    img = imread(testImgs.Files{i});
    
    % Padding 
    img = PaddingVariance(img, 0, maxHeight, maxWidth);
    [c,r,~] = size(img);
    if c ~= maxHeight
        totalHeightWrong = totalHeightWrong + 1;
    end
    if r ~= maxWidth
        totalWidthWrong = totalWidthWrong + 1;
    end
    
    [c,r,~] = size(img);
    if c ~= maxHeight
        totalHeightWrong = totalHeightWrong + 1;
    end
    if r ~= maxWidth
        totalWidthWrong = totalWidthWrong + 1;
    end

    
    % Gaussian distort
%     img = imnoise(img,'gaussian');

    % Colouring
%     RGB = randi([1 3], 1,1);
%     ratio = 0.8 + rand(1,1)*(1.2-0.8);
%     img(:,:,RGB) =  img(:,:,RGB)* ratio;
    
    % Save images in new distorted folder
    fileLocation = testImgs.Files{i};
    folderPath = split(fileLocation,"\");
    fileName = convertStringsToChars('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Test\' + string(testImgs.Labels(i,1)) + '\' + string(folderPath{end}));
    imwrite(img, fileName);
    
end

% Distort validation images
parfor i = 1 : length(valImgs.Labels)
    
    % Load image
    img = imread(valImgs.Files{i});
    
    % Padding 
    img = PaddingVariance(img, 0, maxHeight, maxWidth);
    [c,r,~] = size(img);
    if c ~= maxHeight
        totalHeightWrong = totalHeightWrong + 1;
    end
    if r ~= maxWidth
        totalWidthWrong = totalWidthWrong + 1;
    end
    
    [c,r,~] = size(img);
    if c ~= maxHeight
        totalHeightWrong = totalHeightWrong + 1;
    end
    if r ~= maxWidth
        totalWidthWrong = totalWidthWrong + 1;
    end

    
    % Gaussian distort
%     img = imnoise(img,'gaussian');

    % Colouring
%     RGB = randi([1 3], 1,1);
%     ratio = 0.8 + rand(1,1)*(1.2-0.8);
%     img(:,:,RGB) =  img(:,:,RGB)* ratio;
    
    % Save images in new distorted folder
    fileLocation = valImgs.Files{i};
    folderPath = split(fileLocation,"\");
    fileName = convertStringsToChars('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Validation\' + string(valImgs.Labels(i,1)) + '\' + string(folderPath{end}));
    imwrite(img, fileName);
    
end
%%
trainImgs = imageDatastore('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Train\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
testImgs = imageDatastore('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Test\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
valImgs = imageDatastore('Filtered_Krill_Data\Lateral\' + string(folderName) + '\Validation\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

save('Filtered_Krill_Data\Lateral\' + string(folderName) + '/' + 'train' + string(folderName),'trainImgs');
save('Filtered_Krill_Data\Lateral\' + string(folderName) + '/' + 'test' + string(folderName),'testImgs');
save('Filtered_Krill_Data\Lateral\' + string(folderName) + '/' + 'val' + string(folderName),'valImgs');