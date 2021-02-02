function [needFlip] = krillNeedFlip(binaryImage)
%KRILLNEEDFLIP Summary of this function goes here
%   Detailed explanation goes here

% Creates dimensions of image
columns = length(binaryImage(1,:,1));
% Creates left and right side of binary masked image
leftHalf = binaryImage(:,1:floor(columns/2));
rightHalf = binaryImage(:,floor(columns/2)+1:end);
% counts total amount of 1's in the binary mask from each side
numBlackPixelsLeft = sum(leftHalf(:));
numBlackPixelsRight = sum(rightHalf(:));

if(numBlackPixelsLeft < numBlackPixelsRight)
    needFlip = 1;
else
    needFlip = 0;
end

end

