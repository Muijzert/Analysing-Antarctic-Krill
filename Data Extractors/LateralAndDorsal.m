%% Pairs lateral and dorsal images together then pads each individually and then concatenates them on top of each other.
% Parameters
folderName = 'FolderedLDFlippedImages';
displacementRandom = 0;
flipKrill = true;
%%
% Read Lateral table which references alternative dorsal images
% lateralData = readtable('Filtered_Krill_Data\Lateral\Lateral_Min_Classes_Table.csv');
lateralData = readtable('Filtered_Krill_Data\Dorsal & Lateral\Lateral_Fixed_Min_Classes_Table.csv');

fixedLateralData = lateralData;
% Makes lists of lateral and dorsal IDs 
latIDs = table2cell(lateralData(:, 9));
dorIDs = table2cell(lateralData(:, 10));
classIDs = table2cell(lateralData(:, 2));
%% Creates folder

% Make folder directory 
mkdir('Filtered_Krill_Data/Dorsal & Lateral', string(folderName));
folderLocation = strcat('Filtered_Krill_Data/Dorsal & Lateral/', string(folderName));

% List subset folders and class folders
subsets = {'Train', 'Validation', 'Test'};
categories = unique(classIDs);

% Makes folders for post-images

for cl = 1 : length(categories)
    % Make class folder
    mkdir(strcat(folderLocation,'/'), string(categories(cl)));
end

% Add to path
addpath (genpath(folderLocation));
%% Removes indexes where there are no dorsal images
% Finds indexes where 'NONE' is
noneIndex = find(contains(dorIDs,'NONE'));

% Remove indexes where there is no dorsal image
dorIDs(noneIndex,:) = [];
latIDs(noneIndex,:) = [];
% classIDs(noneIndex,:) = [];

total = 0;
latError = {};
dorError = {};
dorErrorIndex = [];
latErrorIndex = [];
dorH = 488;
dorW = 1663;
latH = 488;
latW = 1662;
totalWrongSidedKrill = 0;
u = 0;
flipImageList = {};

% Loops through list of lateral images which have a dorsal pair
for i = 1 : size(latIDs,1)
    if ~contains(dorIDs{i},'NONE')
        % Reads dorsal and lateral images
        latImg = imread('Krill data-set\Krill images\' + string(latIDs{i}) + '.jpg');
        dorImg = imread('Krill data-set\Krill images\' + string(dorIDs{i}) + '.jpg');
        
        % Check where eye is of dorsal image
        % If on wrong side flip dorsal and krill
        if flipKrill
            % LATERAL Creates Binary Mask 
            [binaryImage, ~] = createMaskDorsalHighSens(dorImg);

            % LATERAL Collum length of krill
            columns = length(dorImg(1,:,1));

            % Creates left and right side of binary masked image
            leftHalf = binaryImage(:,1:floor(columns/2));
            rightHalf = binaryImage(:,floor(columns/2)+1:end);
            
            % Counts total amount of 1's in the binary mask from each side
            numBlackPixelsLeft = sum(leftHalf(:));
            numBlackPixelsRight = sum(rightHalf(:));
            
            % If right side has more pixels than right 
            if(numBlackPixelsLeft < numBlackPixelsRight)
                % Flip image
                dorImg = fliplr(dorImg);
                latImg = fliplr(latImg);
                
%                 % Stores image location for montage
%                 flipImageList(end + 1) = {'Krill data-set\Krill images\' + string(dorImg{i}) + '.jpg'}; % LATERAL
%                 
%                 % Once every 300
%                 if(u == 300) 
%                     % Displays 300 krill images which hav ebeen flipped
%                     figure;
%                     displayList = string(flipImageList);
%                     montage(displayList,'Size', [20,15],'ThumbnailSize',[150,450],'BorderSize',[2 2]);
%                     flipImageList = {};
%                     u = 0;
%                 end
%                 u = u + 1;
%                 totalWrongSidedKrill = totalWrongSidedKrill + 1;   
            end
        end
        
        % Pad images 
        PadLatImg = PaddingVariance(latImg, displacementRandom, latH, dorW);
        PadDorImg = PaddingVariance(dorImg, displacementRandom, dorH, dorW);

        % Add images together
        krillImage = cat(1, PadLatImg, PadDorImg);
        
        % Saves new images
        imwrite(krillImage, convertStringsToChars('Filtered_Krill_Data\Dorsal & Lateral\' + string(folderName) + '\' + string(classIDs{i}) + '\' + string(latIDs{i}) + '.jpg'));
    end
end

