function SaltAndPepperNoiseReductionv2(image)

    % Add salt and pepper noise with a density of 0.05 to the image.
    noisy_img = imnoise(image, 'salt & pepper', 0.02);
    % Apply a median filter to the noisy image.
    filtered_img = denoiseMedian(noisy_img);
    % Display and store the noisy and filtered images.
    showImages(noisy_img, filtered_img);
end

function im_denoised = denoiseMedian(noisy_img)
    % This function applies a median filter to an input image.

    im_denoised = noisy_img;

    % Check if the input image is RGB or grayscale.
    if isRGB(noisy_img)
        % Apply the median filter to each color channel of the RGB image separately.
        for i = 1:3
            filtered_img = medfilt2(noisy_img(:, :, i), [3, 3]);
            im_denoised(:, :, i) = filtered_img;
        end

    else
        % Apply the median filter to the grayscale image.
        im_denoised = medfilt2(noisy_img, [3, 3]);
    end

end

function showImages(noisy_img, filtered_img)
    % This function displays and stores an input image and its filtered version.
    % Display the noisy image.
    subplot(1, 2, 1);
    imshow(noisy_img);
    title('Noisy Image');

    % Display the filtered image.
    subplot(1, 2, 2);
    imshow(filtered_img);
    title('Filtered Image');
end
