function noiseReduction(image, imagePath)
    % This function applies a noise reduction filter to an input image.

    % Ask the user which type of noise to add to the image.
    noise = questdlg('Which type of noise would you add to the image?', 'Answer', 'Salt and pepper', 'Gaussian', "Gaussian");

    % Add the chosen noise to the image and apply the appropriate filter.
    switch noise
        case 'Salt and pepper'
            % Add salt and pepper noise with a density of 0.05 to the image.
            noisy_img = imnoise(image, 'salt & pepper', 0.05);
            % Apply a median filter to the noisy image.
            filtered_img = denoiseMedian(noisy_img);
            % Display and store the noisy and filtered images.
            showAndStoreImages(noisy_img, filtered_img, imagePath);

        case 'Gaussian'
            % Add Gaussian noise with a mean of 0.001 and variance of 0.002 to the image.
            noisy_img = imnoise(image, 'gaussian', 0.001, 0.002);
            % Apply a wavelet-based denoising filter to the noisy image.
            filtered_img = denoiseGaussian(noisy_img);
            % Display and store the noisy and filtered images.
            showAndStoreImages(noisy_img, filtered_img, imagePath);
    end

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

function im_denoised = denoiseGaussian(image)
    % This function applies a wavelet-based denoising filter to an input image.

    % Convert the input image to double precision.
    tmpImm = im2double(image);
    % Apply the wavelet-based denoising filter with a threshold of 3 and a Haar wavelet.
    im_denoised = wdenoise2(tmpImm, 3, "Wavelet", "haar");

end

function showAndStoreImages(noisy_img, filtered_img, imagePath)
    % This function displays and stores an input image and its filtered version.

    % Display the noisy image.
    subplot(1, 3, 1);
    imshow(noisy_img);
    title('Noisy Image');

    % Display the filtered image.
    subplot(1, 3, 2);
    imshow(filtered_img);
    title('Filtered Image');

    % Allow the user to choose whether or not to store the filtered image.
    store = questdlg('Would you like to store the image?', 'Store Selector', 'Yes', 'No', 'Yes');

    if strcmp(store, 'Yes')
        % Save the filtered image to the specified path.
        imwrite(filtered_img, strcat(imagePath, 'maskedImage.png'), 'png');
    end

end
