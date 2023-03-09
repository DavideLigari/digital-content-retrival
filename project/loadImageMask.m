function [image, binaryImage,imagePath] = loadImageMask()
    % Load the image and display it.
    [imageName, imagePath] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
    original = imread(strcat(imagePath, imageName));

    if isRGB(original)
        color = questdlg('would you convert the image to gray scale:', 'Answer', 'Yes', 'No', 'No');

        switch color
            case 'Yes'
                image = checkGrey(original);
            case 'No'
                image = original;
        end

    end

    figure('Position', get(0, 'Screensize'));
    subplot(1, 3, 1);
    imshow(image, []);
    title('Original Image');

    % Prompt the user to draw a shape on the image.
    shape = questdlg('Select a shape:', 'Shape Selector', 'Rectangle', 'Ellipse', 'Polygon', 'Rectangle');

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
end
