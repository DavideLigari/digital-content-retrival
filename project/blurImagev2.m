function blurImagev2(image, binaryImage)
    % BLURIMAGE blurs an image either inside or outside a binary mask and displays the result
    %
    % Inputs:
    %   - image: the input image (can be grayscale or RGB)
    %   - binaryImage: a binary mask to define the region to blur
    %   - imagePath: the path to store the blurry image if desired
    %
    % Outputs: none


    blurryImage_inside = blurInside(image, binaryImage);
    blurryImage_outside = blurOutside(image, binaryImage);
    

    % Display the blurry images
    subplot(1, 2, 1)
    imshow(blurryImage_inside);
    title('Blurred inside');

    subplot(1, 2, 2)
    imshow(blurryImage_outside);
    title('Blurred outside');
end

function blurryImage = blurInside(image, binaryImage)
    % blurs an image inside a binary mask and returns the result
    %
    % Inputs:
    %   - image: the input image (can be grayscale or RGB)
    %   - binaryImage: a binary mask to define the region to blur
    %
    % Outputs:
    %   - blurryImage: the blurry image

    % Initialize the standard deviation for the Gaussian blur
    sigma = 20;

    % Apply the Gaussian blur to the image
    blurredImage = imgaussfilt(image, sigma);

    % Separate the image into inside and outside masks for each color channel if RGB
    if isRGB(image)
        outsideMasked = blurredImage;
        insideMasked = image;

        for i = 1:3
            tmpOutsideMasked = blurredImage(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;

            tmpInsideMasked = image(:, :, i);
            tmpInsideMasked(binaryImage) = 0;
            outsideMasked(:, :, i) = tmpOutsideMasked;
            insideMasked(:, :, i) = tmpInsideMasked;
        end

        % Apply the mask to the grayscale image
    else
        outsideMasked = blurredImage;
        outsideMasked(~binaryImage) = 0;

        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end

    % Add the inside and outside masked images together
    blurryImage = imadd(insideMasked, outsideMasked);

end

function blurryImage = blurOutside(image, binaryImage)
    % blurs an image outside a binary mask and returns the result
    %
    % Inputs:
    %   - image: the input image (can be grayscale or RGB)
    %   - binaryImage: a binary mask to define the region to blur
    %
    % Outputs:
    %   - blurryImage: the blurry image
    % Define the amount of Gaussian blurring to apply
    sigma = 20;

    % Create a copy of the original image to work with
    blurredImage = image;

    % Apply Gaussian blurring to the copied image
    blurredImage = imgaussfilt(blurredImage, sigma);

    % If the input image is RGB, loop through each color channel
    if isRGB(image)
        % Create two copies of the blurred image and the original image
        outsideMasked = blurredImage;
        insideMasked = image;

        % Loop through each color channel
        for i = 1:3
            % Create a temporary copy of the current color channel of the
            % original image, and set all pixels outside the binary mask
            % to zero
            tmpOutsideMasked = image(:, :, i);
            tmpOutsideMasked(~binaryImage) = 0;

            % Create a temporary copy of the current color channel of the
            % blurred image, and set all pixels inside the binary mask to
            % zero
            tmpInsideMasked = blurredImage(:, :, i);
            tmpInsideMasked(binaryImage) = 0;

            % Replace the corresponding color channels in the outsideMasked
            % and insideMasked images with the temporary copies
            outsideMasked(:, :, i) = tmpOutsideMasked;
            insideMasked(:, :, i) = tmpInsideMasked;
        end

        % If the input image is grayscale, do the same operations without looping
    else
        % Create two copies of the blurred image and the original image
        outsideMasked = blurredImage;
        outsideMasked(~binaryImage) = 0;

        insideMasked = image;
        insideMasked(binaryImage) = 0;
    end

    % Add the insideMasked and outsideMasked images together to create the final
    % blurred image
    blurryImage = imadd(insideMasked, outsideMasked);
end
