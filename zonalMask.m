

function zonalMask(grayImage,binaryImage)

% Get the boundary of the freehand shape.
boundaries = bwboundaries(binaryImage);
xy = boundaries{1};
x = xy(:, 2);
y = xy(:, 1);


% Create a new image with the inside of the shape blackened out and display it.
insideMasked = grayImage;
insideMasked(binaryImage) = 0;
subplot(1, 3, 2);
imshow(insideMasked);
title('Masked inside region');

% Mask the image 
maskedImage = grayImage;
maskedImage(~binaryImage) = 0;

% Crop the image to the shape and display the result.
topLine = min(x);
bottomLine = max(x);
leftColumn = min(y);
rightColumn = max(y);
width = bottomLine - topLine + 1;
height = rightColumn - leftColumn + 1;
croppedImage = imcrop(maskedImage, [topLine, leftColumn, width, height]);
subplot(1, 3, 3);
imshow(croppedImage);
title('Cropped image');
end