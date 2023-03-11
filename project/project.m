% Clear any existing variables, the command window, and the figure windows.
clear;
clc;
close all;

% Load the image.
[imageName, imagePath] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(imagePath, imageName));

% Prompt the user to select an action.
action = input('Select one of the following actions : \n 1) ZonalMask \n 2) Blur a zone \n 3) NoiseReduction \n 4) get image informations');

% Perform the selected action.
switch action
    case 1
        % Load the image and the binary mask for the image.
        % Prompt the user to select an image and its mask.
        binaryImage = createMask(original);
        % Call the zonalMask function to generate the zonal mask.
        zonalMask(original, binaryImage, imagePath);

    case 2
        % Load the image and the binary mask for the image.
        % Prompt the user to select an image and its mask.
        binaryImage = createMask(original);
        % Call the blurImage function to blur the selected zone.
        blurImage(original, binaryImage, imagePath);
    case 3
        % Call the noise reduction function to remove the noise in the image.
        noiseReduction(original, imagePath);
    case 4
        % Call the imageInformations function to display the image information.
        imageInformations(original, imagePath);

end
