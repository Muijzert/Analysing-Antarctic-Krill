function [img] = RandomErase(inputImg)

% Loads image 
img = inputImg;

% Find max height and width of erase
maxWidth= ceil(size(img, 2) / 2);
maxHeight= ceil(size(img, 1) / 2);

% Create random size of erase box
x = randi(size(img, 1));
y = randi(size(img, 2));

h = randi(min(size(img, 1) - x + 1, maxHeight), 1);
w = randi(min(size(img, 2) - y + 1, maxWidth), 1);

img(x:x+h,y:y+w,:)=128;
