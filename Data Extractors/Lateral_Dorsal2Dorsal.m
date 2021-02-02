%% Parameters 

folderName = 'SortedD';
startFolder = 'FolderedFlippedImages';
imageView = 'Dorsal & Lateral';
newImageView = 'Dorsal';
%% Creates imagedatabase with classes labeled

folderedImgs = imageDatastore('Filtered_Krill_Data\'+ string(imageView) + '\' + string(startFolder),'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%% Make folder directory 

mkdir('Filtered_Krill_Data\'+ string(newImageView) + '\', string(folderName));
folderLocation = strcat('Filtered_Krill_Data\'+ string(newImageView) + '\', string(folderName));

% List subset folders and class folders
categories = unique(folderedImgs.Labels);

for cl = 1 : length(categories)
    % Make class folder
    mkdir(folderLocation, string(categories(cl)));
end

% Adds new folder and sub folders to path
addpath (genpath(folderLocation));

%% Foldered images duplication
for i = 1 : length(folderedImgs.Labels)
    
    % Reads img
    img = imread(folderedImgs.Files{i});

    % Extracts bottom image (Dorsal)
    img = img(end-488:end,end-1662:end,:);
    
    % Finds Lateral file name
    fileLocation = folderedImgs.Files{i};
    folderPath = split(fileLocation,"\");
    
    % Saves img inside class folder
    fileName = convertStringsToChars('Filtered_Krill_Data\'+ string(newImageView) + '\' + string(folderName) + '\' ...
        + string(folderedImgs.Labels(i)) + '\' + string(folderPath{end}));
%     splitfileName = split(fileName, "_DUP");
    imwrite(img, fileName);
end

%% Save imageDatastores
trainImgs = imageDatastore('Filtered_Krill_Data\'+ string(newImageView) + '\' + string(folderName) + '\', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

save('Filtered_Krill_Data\'+ string(newImageView) + '\' + string(folderName) + '\' + string(folderName),'trainImgs');