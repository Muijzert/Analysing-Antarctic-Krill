%% Pairs lateral and dorsal images together then pads each individually and then concatenates them on top of each other.

% Read Lateral table which references alternative dorsal images
lateralData = readtable('Filtered_Krill_Data\Lateral\Lateral_Min_Classes_Table.csv');
% lateralData = readtable('Filtered_Krill_Data\Dorsal & Lateral\Lateral_Fixed_Min_Classes_Table.csv');

fixedLateralData = lateralData;
% Makes lists of lateral and dorsal IDs 
latIDs = table2cell(lateralData(:, 9));
dorIDs = table2cell(lateralData(:, 10));
classIDs = table2cell(lateralData(:, 2));
%% Removes indexes where there are no dorsal images
% Finds indexes where 'NONE' is
% noneIndex = find(contains(dorIDs,'NONE'));

total = 0;
latError = {};
dorError = {};
dorErrorIndex = [];
latErrorIndex = [];
% indexError
% Loops through list of lateral images which have a dorsal pair
for i = 1 : size(latIDs,1)
    if ~contains(dorIDs{i},'NONE')
        try
            % Reads dorsal and lateral images in
            latImg = imread('Krill data-set\Krill images\' + string(latIDs{i}) + '.jpg');
        catch
            total = total + 1;
            latError(end + 1,:)= latIDs(i,:);
            latErrorIndex(end + 1,:)= i;
                if contains(latIDs{i},'__')
                    boardPos = strfind(latIDs{i}, '__') + 1;
                    startString = latIDs{i}(1:boardPos-1);
                    endString = latIDs{i}(boardPos:end);
                    combinedString = char(startString + "Board" + endString);
                    fixedLateralData(i,9) = {combinedString}; 
                else
                    boardPos = strfind(latIDs{i}, 'Net') + 5;
                    startString = latIDs{i}(1:boardPos-1);
                    endString = latIDs{i}(boardPos:end);
                    combinedString = char(startString + "Board" + endString);
                    fixedLateralData(i,9) = {combinedString}; 
                end
        end
        
        try
            dorImg = imread('Krill data-set\Krill images\' + string(dorIDs{i}) + '.jpg');
        catch
            % Removes any images that don't exist from the index
            dorError(end + 1,:)= dorIDs(i,:);
            dorErrorIndex(end + 1,:)= i;
            total = total + 1;
            if contains(dorIDs{i},'__')
                boardPos = strfind(dorIDs{i}, '__') + 1;
                startString = dorIDs{i}(1:boardPos-1);
                endString = dorIDs{i}(boardPos:end);
                combinedString = char(startString + "Board" + endString);
                fixedLateralData(i,10) = {combinedString}; 
            else
                boardPos = strfind(dorIDs{i}, 'Net') + 5;
                startString = dorIDs{i}(1:boardPos-1);
                endString = dorIDs{i}(boardPos:end);
                combinedString = char(startString + "Board" + endString);
                fixedLateralData(i,10) = {combinedString}; 
            end
            
        end
    end
    
writetable(fixedLateralData,'Filtered_Krill_Data\Dorsal & Lateral\Lateral_Fixed_Min_Classes_Table.csv');
end

