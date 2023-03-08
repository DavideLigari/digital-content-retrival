% Clear the workspace, close all figures, and show the workspace panel.
clear;
clc;
close all;
workspace;

% Load the greyscale image and display it.
[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
grayImage = checkGrey(original);
figure('Position', get(0, 'Screensize'));
subplot(1, 3,   1);
imshow(grayImage, []);
title('Original Grayscale Image');

% Prompt the user to draw a shape on the image.
shape = questdlg('Select a shape:','Shape Selector', 'Rectangle', 'Ellipse', 'Polygon','Rectangle');

% Draw the shape on the image.
switch shape
    case 'Rectangle'
        hFH = drawrectangle();
    case 'Ellipse'
        hFH = drawellipse();
    case 'Polygon'
        hFH = drawpolygon();
end

binaryImage = hFH.createMask();

% Prompt the user to select the desired action
action = questdlg('Select an action:','Action Selector', 'zonalMask', 'blurZone','zonalMask');

switch action
    case 'zonalMask'
        zonalMask(grayImage,binaryImage);

    case 'blurZone'
        blurImage(grayImage,binaryImage);
end