% Filters lateral images
% Reflects krill which are facing the wrong side ( default is eyes on left side)
% Obtain padcolour which is the mode colour of the background
% Pad images to make them same size and square image. padcolour is the colour of the padding
% Resize (maybe)
% Save images with same names but in different folder

% Reads csv file in 
krillData = readtable('krill_data_set_alphabetical.csv');

% Stores image locations and labels
krillImages = imageDatastore('Krill data-set',...
'IncludeSubfolders',true);
krillImages.Labels = table2cell(krillData(:,2));
tbl = countEachLabel(krillImages);


%creating variables
krillFileIDs = {};
krillLabelIDs = {};
totalAdded = 1;
lateralTable = table;


% Filters lateral images
for i = 1 : length(krillImages.Files)
    
    if (strcmp(string(krillData{i,11}),'Lateral'))
        krillFileIDs{totalAdded,1} = krillImages.Files{i};
        krillLabelIDs{totalAdded,1} = krillImages.Labels{i};
        lateralTable(totalAdded,:) = krillData(i,:);
        totalAdded = totalAdded + 1;
        
    end
end

%Creates list and labels of image locations of lateral images
krillImages.Files = krillFileIDs;
krillImages.Labels = krillLabelIDs;

%% Saves lateral images to Lateral folder and saves lateral CSV file
krillLateralFileLocations = krillImages.Files;
krillLateralIDs = krillImages.Labels;

% PARELLEL PROCESSING
parfor p = 1 : length(krillImages.Files)
    folderPath = split(krillLateralFileLocations(p),"\");
    imwrite(imread(krillLateralFileLocations{p}), ...
        convertStringsToChars('Filtered_Krill_Data\Lateral\Images\' + string(folderPath{end})));
end
%% NON-PARELLEL PROCESSING
% for i = 1 : length(krillImages.Files)
%    imwrite(imread(krillLateralFileLocations{i}), convertStringsToChars('Filtered_Krill_Data\Lateral\Images\' + string(krillLateralFileLocations{i}) + '.jpeg'));
% end
%% 

% Writes Lateral Table to file
writetable(lateralTable,'Filtered_Krill_Data\Lateral\Lateral_Table.csv')


