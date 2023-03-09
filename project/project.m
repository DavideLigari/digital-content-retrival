% Clear any existing variables, the command window, and the figure windows.
clear;
clc;
close all;

% Load the image and the binary mask for the image.
% Prompt the user to select an image and its mask.
[image, binaryImage, imagePath] = loadImageMask();

% Prompt the user to select an action.
action = questdlg('Select an action:', 'Action Selector', 'ZonalMask', 'BlurZone', 'ZonalMask');

% Perform the selected action.
switch action
    case 'ZonalMask'
        % Call the zonalMask function to generate the zonal mask.
        zonalMask(image, binaryImage, imagePath);

    case 'BlurZone'
        % Call the blurImage function to blur the selected zone.
        blurImage(image, binaryImage, imagePath);
end
