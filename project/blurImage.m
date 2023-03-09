function blurImage(image, binaryImage, imagePath)
    blur = questdlg('Select an the zone to blur:', 'Mask Selector', 'Inside', 'Outside', 'Outside');
    blurryImage = image;

    switch blur
        case 'Inside'
            blurryImage = blurInside(image, binaryImage);

        case 'Outside'
            blurryImage = blurOutside(image, binaryImage);
    end

    subplot(1, 3, 2)
    imshow(blurryImage);
    title('Blurry Image');

    store = questdlg('would you store the image ?', 'store Selector', 'Yes', 'No', 'Yes');

    if strcmp(store, 'Yes')
        imwrite(blurryImage, strcat(imagePath, 'blurryImage.png'), 'png');
    end

end

function blurryImage = blurInside(image, binaryImage)
    sigma = 5;
    blurredImage = image;
    blurredImage = imgaussfilt(blurredImage, sigma);

    if isRGB(image)
        outsideMasked = blurredImage;
        insideMasked = image;
        %for each color substitute the selected region with a blurry one
        for i = 1:3
            tmpOutsideMasked = blurredImage(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;

            tmpInsideMasked = image(:, :, i);
            tmpInsideMasked(binaryImage) = 0;
            outsideMasked(:, :, i) = tmpOutsideMasked;
            insideMasked(:, :, i) = tmpInsideMasked;
        end

    else
        outsideMasked = blurredImage;
        outsideMasked(~binaryImage) = 0;

        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end

    blurryImage = imadd(insideMasked, outsideMasked);

end

function blurryImage = blurOutside(image, binaryImage)
    sigma = 5;
    blurredImage = image;
    blurredImage = imgaussfilt(blurredImage, sigma);

    if isRGB(image)
        outsideMasked = blurredImage;
        insideMasked = image;

        %for each color substitute the selected region with a blurry one
        for i = 1:3
            tmpOutsideMasked = image(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;

            tmpInsideMasked = blurredImage(:, :, i);
            tmpInsideMasked(binaryImage) = 0;
            outsideMasked(:, :, i) = tmpOutsideMasked;
            insideMasked(:, :, i) = tmpInsideMasked;
        end

    else
        outsideMasked = blurredImage;
        outsideMasked(~binaryImage) = 0;

        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end

    blurryImage = imadd(insideMasked, outsideMasked);

end
