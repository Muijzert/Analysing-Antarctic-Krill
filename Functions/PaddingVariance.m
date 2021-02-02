function [paddedImage] = PaddingVariance(img, maxRandom, maxHeight, maxWidth)
%PADDING Summary of this function goes here
%   Detailed explanation goes here
[r,c,~] = size(img);
heightDisplacement =  randi(2)-1;
widthDisplacement =  randi(2)-1;

if (r + maxRandom) > maxHeight
    maxRandomHeight = maxHeight - r;
else
    maxRandomHeight = maxRandom;
end
if (c + maxRandom) > maxWidth
    maxRandomWidth = maxWidth - c;
else
    maxRandomWidth = maxRandom;
end
if maxRandomHeight ~= 0
%     heightRandom = randi(maxRandomHeight);
    heightRandom = 50;
else 
    heightRandom = 0;
end
if maxRandomWidth ~= 0
%     widthRandom = randi(maxRandomWidth);
    widthRandom = 50;
else
    widthRandom = 0;
end

switch(heightDisplacement) 
    case 0
       padTop = ceil(((maxHeight - r) / 2) - heightRandom);
       padBot = ceil(((maxHeight - r) / 2) + heightRandom);
       if padTop < 0
          padBot = padBot + padTop;
           padTop = 0; 
       end
       if maxHeight < (padTop + padBot + r)
           padBot = padBot - ((padTop + padBot + r) - maxHeight);
       end
    case 1
       padTop = ceil(((maxHeight - r) / 2) + heightRandom);
       padBot = ceil(((maxHeight - r) / 2) - heightRandom);
       if padBot < 0
           padTop = padTop + padBot;
           padBot = 0; 
       end
       if maxHeight < (padTop + padBot + r) 
           padTop = padTop  - ((padTop + padBot + r) - maxHeight);
       end
end
    
switch(widthDisplacement) 
    case 0
       padRight = ceil(((maxWidth - c) / 2) - widthRandom);
       padLeft = ceil(((maxWidth - c) / 2) + widthRandom);
       if padRight < 0
           padLeft = padLeft + padRight;
           padRight = 0; 
       end
       
       if maxWidth < (padRight + padLeft + c)
           padLeft = padLeft - 1;
       end
    case 1
       padRight = ceil(((maxWidth - c) / 2) + widthRandom);
       padLeft = ceil(((maxWidth - c) / 2) - widthRandom);
       if padLeft < 0
           padRight = padRight + padLeft;
           padLeft = 0; 
       end
       if maxWidth < (padRight + padLeft + c)
           padRight = padRight - 1;
       end
end

padColor = [70 96 255];        %# Padding colour
if isa(img, 'double')
    padColor = im2double(uint8(padColor));
end

padColor = reshape(padColor,1,1,3); 
% Pad rows
img = cat(1,repmat(padColor,floor(padTop),c),...         %# Top padding
                    img,...                                 %# Image
                    repmat(padColor,ceil(padBot),c));    %# Bottom padding
               
% Pad columns
[r,~,~] = size(img);
paddedImage = cat(2,repmat(padColor,r,floor(padLeft)),...  %# Left padding
                    img,...                                 %# Image
                    repmat(padColor,r,ceil(padRight)));     %# Right padding
end

