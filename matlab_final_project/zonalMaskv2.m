function zonalMaskv2(image, binaryImage)
    % Allow user to select which zone to mask.

    % black out the inside of the shape.
    insideZonalMask(image, binaryImage);
    %black out the outside of the shape.
    outsideZonalMasking(image, binaryImage);
end

function insideMasked = insideZonalMask(image, binaryImage)

    if isRGB(image)
        insideMasked = image;

        for i = 1:3
            % Black out the inside of the shape in each color channel.
            tmpInsideMasked = image(:, :, i);
            tmpInsideMasked(binaryImage) = 0;

            insideMasked(:, :, i) = tmpInsideMasked;
        end

    else
        % If the image is grayscale, just black out the inside of the shape.
        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end
    % Display the masked image.
    subplot(1, 2, 1);
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
            % Black out the outside of the shape in each color channel.
            tmpOutsideMasked = image(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;
            outsideMasked(:, :, i) = tmpOutsideMasked;
        end

    else
        % If the image is grayscale, just black out the outside of the shape.
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
    % Display the masked image.
    subplot(1, 2, 2);
    imshow(outsideMasked);
    title('Masked outside region');

end
