% Loads in Lateral krill images

krillData = readtable('krill_data_set_alphabetical.csv');
% Stores image locations and labels
% Creates table
% Filters lateral images
totalAdded = 1;
lateralTable = table;
for i = 1 : height(krillData)
    
    if (strcmp(string(krillData{i,11}),'Lateral'))
        lateralTable(totalAdded,:) = krillData(i,:);
        totalAdded = totalAdded + 1;
    end
end
% Writes table
writetable(lateralTable,'Filtered_Krill_Data\Lateral\Lateral_All_Classes_Table.csv');

imds = imageDatastore('Filtered_Krill_Data/Lateral/FlippedImages',...
'IncludeSubfolders',true);
imds.Labels = table2cell(lateralTable(:,2));
krillFileIDs = {};
krillLabelIDs = {};
totalAdded = 1;

for i = 1 : length(imds.Files)
    
    if (strcmp(string(lateralTable{i,11}),'Lateral') && string(lateralTable{i,2}) ~= "" ... 
            && ~strcmp(string(lateralTable{i,2}),',A2') ... 
            && ~strcmp(string(lateralTable{i,2}),'FA5') ... 
            && ~strcmp(string(lateralTable{i,2}),'FS3') ... 
            && ~strcmp(string(lateralTable{i,2}),'M1') ... 
            && ~strcmp(string(lateralTable{i,2}),'MA3') ...  
            && ~strcmp(string(lateralTable{i,2}),'U'))
        krillFileIDs{totalAdded,1} = imds.Files{i};
        krillLabelIDs{totalAdded,1} = imds.Labels{i};
        lateralTableMinClasses(totalAdded,:) = lateralTable(i,:);
        totalAdded = totalAdded + 1;
    end
end

writetable(lateralTableMinClasses,'Filtered_Krill_Data\Lateral\Lateral_Min_Classes_Table.csv');
%%
imds.Files = krillFileIDs;
imds.Labels = krillLabelIDs;
tbl = countEachLabel(imds);
T = countEachLabel(imds);

krillLateralFileLocations = imds.Files;
krillLateralIDs = imds.Labels;
classList = cell(length(imds.Files), 1);
fileNameList = cell(length(imds.Files), 1);

% PARELLEL PROCESSING
parfor p = 1 : length(imds.Files)
    
    % Reads image
    krillImage = imread(krillLateralFileLocations{p});

% saves new images
    folderPath = split(krillLateralFileLocations(p),"\");
    
    fileNameList{p} = convertStringsToChars('Filtered_Krill_Data\Lateral\FlippedClassFolderedImages\' + string(krillLateralIDs{p}) + '\' + string(folderPath{end}));
    classList{p} = krillLateralIDs{p};

    imwrite(krillImage, convertStringsToChars('Filtered_Krill_Data\Lateral\FlippedClassFolderedImages\' + string(krillLateralIDs{p}) + '\' + string(folderPath{end})));
    
end
%%
folderedImgs = imageDatastore(fileNameList);
folderedImgs.Labels = classList;
save('folderedImgs','folderedImgs');