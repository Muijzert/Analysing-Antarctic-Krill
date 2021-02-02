%% Paramters
loadFile = 'RawSorted';
folderName = 'RandomErase';
randomErase = true;
randomEraseLoops = 1;
noise = false;
randMin = 0.01;
randMax = 0.03;
colour = false;
imageView = 'Lateral';

%% Loads imagedatastore
load (strcat('train',loadFile));
load (strcat('test',loadFile));
load (strcat('val',loadFile));

%% Make folder directory 
mkdir('Filtered_Krill_Data\'+ string(imageView) + '\', string(folderName));
folderLocation = strcat('Filtered_Krill_Data\'+ string(imageView) + '\', string(folderName));

% List subset folders and class folders
subsets = {'Train'};
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

% Adds new folder and sub folders to path
addpath (genpath(folderLocation));
%% Augment Training Data

for i = 1 : length(trainImgs.Files)
    % Loads Image
    img = imread(trainImgs.Files{i});
    
    % Colouring
    if colour
        RGB = randi([1 3], 1,1);
        ratio = 0.8 + rand(1,1)*(1.2-0.8);
        img(:,:,RGB) =  img(:,:,RGB)* ratio;
    end
    
    
    % Gaussian Noise
    if noise
        r = randMin+rand(1)*(randMax-randMin);
%         img = imnoise(img,'gaussian', 1 + r);
        img = imnoise(img,'gaussian', 0, r);
    end
    
    % Random Erase
    if randomErase
        for p = 1 : randomEraseLoops
            img = RandomErase(img);
        end
    end
    
        

    
    % Save images in new distorted folder
     fileLocation = trainImgs.Files{i};
    folderPath = split(fileLocation,"\");
    fileName = convertStringsToChars('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Train\' + string(trainImgs.Labels(i,1)) + '\' + string(folderPath{end}));
    imwrite(img, fileName);
end
%% Copy testing and training imageDatastore 

trainImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '\Train\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'train' + string(folderName),'trainImgs');
save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'test' + string(folderName),'testImgs');
save('Filtered_Krill_Data\'+ string(imageView) + '\' + string(folderName) + '/' + 'val' + string(folderName),'valImgs');