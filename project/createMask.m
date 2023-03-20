% This function loads an image and prompts the user to select a shape on the image.
% It returns the original image,
% a binary mask of the selected shape,
% and the path of the loaded image.
function [binaryImage, image] = createMask(original)
    image = original;
    % If the loaded image is a color image, prompt the user to convert it to grayscale or not.
    if isRGB(original)
        color = questdlg('would you convert the image to gray scale:', 'Answer', 'Yes', 'No', 'No');

        switch color
            case 'Yes'
                % Convert the image to grayscale.
                image = checkGrey(original);
            case 'No'
                image = original;
        end

    end

    % Display the original image.
    figure('Position', get(0, 'Screensize'));
    subplot(1, 2, 1);
    imshow(image);
    title('Original Image');

    % Prompt the user to select a shape and draw it on the image.
    shape = questdlg('Select a shape:', 'Shape Selector', 'Rectangle', 'Ellipse', 'Polygon', 'Rectangle');

    switch shape
        case 'Rectangle'
            hFH = drawrectangle();
        case 'Ellipse'
            hFH = drawellipse();
        case 'Polygon'
            hFH = drawpolygon();
    end

    % Create a binary mask of the selected shape.
    % The code hFH.createMask() is a method of the handle object hFH which is used to create a binary mask of a selected shape.
    % The handle object hFH is a graphics object that represents the selected shape on an image, such as a rectangle, ellipse or polygon.
    % When the method createMask() is called on the handle object, it creates a binary mask with the selected shape filled in with white pixels (value 1)
    % and the background filled with black pixels (value 0), based on the coordinates of the selected shape.
    binaryImage = hFH.createMask();
end
