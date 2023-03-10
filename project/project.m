% Clear any existing variables, the command window, and the figure windows.
clear;
clc;
close all;

% Load the image and display it.
[imageName, imagePath] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(imagePath, imageName));

% Prompt the user to select an action.
action = questdlg('Select an action:', 'Action Selector', 'ZonalMask', 'BlurZone',"NoiseReduction", 'ZonalMask');

% Perform the selected action.
switch action
    case 'ZonalMask'
        % Load the image and the binary mask for the image.
        % Prompt the user to select an image and its mask.
        binaryImage = createMask(original);
        % Call the zonalMask function to generate the zonal mask.
        zonalMask(image, binaryImage, imagePath);

    case 'BlurZone'
        % Load the image and the binary mask for the image.
        % Prompt the user to select an image and its mask.
        binaryImage = createMask(original);
        % Call the blurImage function to blur the selected zone.
        blurImage(image, binaryImage, imagePath);
    case "NoiseReduction"
        noiseReduction(original, imagePath);
end
