% Change the current folder to the folder of this m-file.
if ~isdeployed
    cd(fileparts(which(mfilename)));
end

% Clear the workspace, close all figures, and show the workspace panel.
clear;
close all;
workspace;

% Load the grayscale image and display it.
[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
grayImage = rgb2gray(original);
figure('Position', get(0, 'Screensize'));
subplot(2, 3, 1);
imshow(grayImage, []);
title('Original Grayscale Image');

% Prompt the user to draw a shape on the image.
shape = questdlg('Select a shape:','Shape Selector', 'Rectangle', 'Ellipse', 'Polygon', 'FreeHand');

% Draw the shape on the image.
switch shape
    case 'Rectangle'
        hFH = drawrectangle();
    case 'Ellipse'
        hFH = drawellipse();
    case 'Polygon'
        hFH = drawpolygon();
    case 'FreeHand'
        hFH = drawfreehand();
end

binaryImage = hFH.createMask();

% Display the binary mask of the shape.
subplot(2, 3, 2);
imshow(binaryImage);
title('Binary mask of the region');

% Calculate the area, in pixels, that was drawn.
numberOfPixels = sum(binaryImage(:));

% Get the boundary of the freehand shape.
boundaries = bwboundaries(binaryImage);
xy = boundaries{1};
x = xy(:, 2);
y = xy(:, 1);

% Plot the shape over the original image.
hold on;
plot(x, y, 'LineWidth', 2);
drawnow;

% Create a new image with the shape "burned in" and display it.
burnedImage = grayImage;
burnedImage(binaryImage) = 255;
subplot(2, 3, 3);
imshow(burnedImage);
title('New image with mask burned into image');

% Mask the image and display the result.
maskedImage = grayImage;
maskedImage(~binaryImage) = 0;
subplot(2, 3, 4);
imshow(maskedImage);
title('Masked outside region');

% Calculate the mean intensity value within the shape and display it.
meanIntensity = mean(maskedImage(binaryImage));
message = sprintf('Mean value within drawn area = %.3f\nNumber of pixels = %d', meanIntensity, numberOfPixels);
msgbox(message);

% Create a new image with the inside of the shape blackened out and display it.
insideMasked = grayImage;
insideMasked(binaryImage) = 0;
subplot(2, 3, 5);
imshow(insideMasked);
title('Masked inside region');

% Crop the image to the shape and display the result.
topLine = min(x);
bottomLine = max(x);
leftColumn = min(y);
rightColumn = max(y);
width = bottomLine - topLine + 1;
height = rightColumn - leftColumn + 1;
croppedImage = imcrop(maskedImage, [topLine, leftColumn, width, height]);
subplot(2, 3, 6);
imshow(croppedImage);
title('Cropped image');

% Ask the user if they want to blur the inside area.
answer = questdlg('Do you want to blur the inside area?', 'Blur Inside Area', 'Yes', 'No', 'No');

% If the user chooses to blur the inside area, apply a Gaussian blur to the insideMasked image.
if strcmp(answer, 'Yes')
    sigma = 5;
    blurredImage = imgaussfilt(insideMasked, sigma);
    subplot(2, 3, 5);
    imshow(blurredImage);
    title('Blurred Inside Region');
else
    % If the user chooses not to blur the inside area, display the insideMasked image.
    subplot(2, 3, 5);
    imshow(insideMasked);
    title('Masked Inside Region');
end

