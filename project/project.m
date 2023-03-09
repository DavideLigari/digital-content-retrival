% Clear the workspace, close all figures, and show the workspace panel.
clear;
clc;
close all;
workspace;
[image, binaryImage,imagePath] = loadImageMask();

% Prompt the user to select the desired action
action = questdlg('Select an action:', 'Action Selector', 'ZonalMask', 'BlurZone', 'ZonalMask');

switch action
    case 'ZonalMask'
        zonalMask(image, binaryImage,imagePath);

    case 'BlurZone'
        blurImage(image, binaryImage,imagePath);
end
