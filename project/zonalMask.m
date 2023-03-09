%this function applies zonal masking to the area selected by the user, using different shapes
function zonalMask(image, binaryImage, imagePath)
    mask = questdlg('Select an the zone to mask:', 'Mask Selector', 'Inside', 'Outside', 'Outside');

    switch mask
        case 'Inside'
            image = insideZonalMask(image, binaryImage);

        case 'Outside'
            image = outsideZonalMasking(image, binaryImage);
    end

    store = questdlg('would you store the image ?', 'store Selector', 'Yes', 'No', 'Yes');

    if strcmp(store, 'Yes')
        imwrite(image, strcat(imagePath, 'maskedImage.png'), 'png');
    end

end

function insideMasked = insideZonalMask(image, binaryImage)

    if isRGB(image)
        insideMasked = image;

        for i = 1:3
            % Create a new image with the inside of the shape blackened out and display it.
            tmpInsideMasked = image(:, :, i);
            tmpInsideMasked(binaryImage) = 0;

            insideMasked(:, :, i) = tmpInsideMasked;
        end

    else
        % Create a new image with the inside of the shape blackened out and display it.
        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end

    subplot(1, 3, 2);
    imshow(insideMasked);
    title('Masked inside region');

end

function outsideMasked = outsideZonalMasking(image, binaryImage)
    % Get the boundary of the shape.
    boundaries = bwboundaries(binaryImage);
    xy = boundaries{1};
    x = xy(:, 2);
    y = xy(:, 1);

    if isRGB(image)
        outsideMasked = image;

        for i = 1:3
            % Create a new image with the outside of the shape blackened out and display it.
            tmpOutsideMasked = image(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;
            outsideMasked(:, :, i) = tmpOutsideMasked;
        end

    else
        % Create a new image with the outside of the shape blackened out and display it.
        outsideMasked = image;
        outsideMasked(~binaryImage) = 0;
    end

    % Crop the image to the shape and display the result.
    topLine = min(x);
    bottomLine = max(x);
    leftColumn = min(y);
    rightColumn = max(y);
    width = bottomLine - topLine + 1;
    height = rightColumn - leftColumn + 1;
    outsideMasked = imcrop(outsideMasked, [topLine, leftColumn, width, height]);

    subplot(1, 3, 2);
    imshow(outsideMasked);
    title('Masked outside region');

end
