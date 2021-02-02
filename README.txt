# What is this project about?
This project explores the use of Convolutional Neural Networks to identify the classifications of krill from images regarding their sex and age. The project utilises krill data from the British AntarcticSurvey’s Western Core Box project.
MatLab was used to code for this project. 

The data for this project has not been uploaded to GitHub due to the size of the data set and augmented data sets which were stored and used locally to save computation time.

# Project Structure

## ClassSampler folder contains

 - ClassSampler 
This creates and saves duplicate images for training data, validation and testing. To create a balanced data set.

## CNNs folder contains

 - vgg16_CNN
Read the training, validation and testing data. Ran it through the vgg16 model and saved confusion matrix with the accuracy
and the trained network.

 - vgg16_Transfer_Learning
Read the training, validation and testing data. Ran it through the vgg16 transfer learning model 
and saved confusion matrix with the accuracy and the trained network.
 - Functions folder 
This contained the confusion matrix producer function.
Randon erase augmentation function.
RunCNN where a classifier and data was inputted and it would return accuracy and store the confusion matrix and then trained network. 


## Data Extractor folder contains

 - ClassFolderer
Extracted file names from spreadsheet. Then foldered krill images into their respected classes folders which was saved
 - Lateral_Dorsal2Dorsal
Used images from the combined lateral & dorsal view and extracted the dorsal image and saved it in a separate folder.
This was done instead of extracting from the original data set as the images had already been flipped and anomalies were already removed.
 - LateralAndDorsal
Reads spreadsheet with dorsal and lateral image IDs. Extracts images and splits them into training, validation and testing.
Then concatenates the lateral and dorsal images together and saves them in a new foldered location.
 - SpreadsheetFixer
Used to inject the word 'Board' into some of the dorsal view IDs. As they were missing.

## Functions

 - createEyeMask
Creates mask to detect eye
 - createMaskDorsalHighSens
Creates mask to detect eye specified for dorsal images
 - createMaskHighSensitive
Creates mask to detect eye with a high sensitivity 
 - krillNeedFlip
Fucntion that inputs krill image and returns if it needs flipping or not
 - PaddingVariance
inputs image with padding dimensions and displacement value. 
The displacement value would randomise so that the image is randomly placed inside the padding.

## Image Modifier

 - DataDistort
This was used to add augmentation and padding to lateral images
 - KrillToolKit
Read spreadsheet file and extracts lateral images and saves them in a folder
 - LateralDorsalModifier
This was used to add augmentation and padding to dorsal images and lateral & dorsal images.
