function noiseReduction(image, imagePath)
    noise = questdlg('which type of noise would you add to the image?', 'Answer', 'Salt and pepper', 'Gaussian', "Gaussian");

    switch noise
        case 'Salt and pepper'
            noisy_img = imnoise(image, 'salt & pepper', 0.05);
            filtered_img = denoiseMedian(noisy_img);
            showAndStoreImages(noisy_img, filtered_img, imagePath);

        case 'Gaussian'
            noisy_img = imnoise(image, 'gaussian', 0.001, 0.002);
            filtered_img = denoiseGaussian(noisy_img);
            showAndStoreImages(noisy_img, filtered_img, imagePath);
    end

end

function im_denoised = denoiseMedian(noisy_img)
    im_denoised = noisy_img;

    if isRGB(noisy_img)

        for i = 1:3
            filtered_img = medfilt2(noisy_img(:, :, i), [3, 3]);
            im_denoised(:, :, i) = filtered_img;
        end

    else
        im_denoised = mmedfilt2(noisy_img, [3, 3]);
    end

end

function im_denoised = denoiseGaussian(image)
    tmpImm = im2double(image);
    im_denoised = wdenoise2(tmpImm, 3, "Wavelet", "haar");

end

function showAndStoreImages(noisy_img, filtered_img, imagePath)

    % Display the noisy image.
    subplot(1, 3, 1);
    imshow(noisy_img);
    title('noisy image');

    % Display the filtered image.
    subplot(1, 3, 2);
    imshow(filtered_img);
    title('filtered image');

    % Allow user to choose whether or not to store the image.
    store = questdlg('would you store the image ?', 'store Selector', 'Yes', 'No', 'Yes');

    if strcmp(store, 'Yes')
        % Save the masked image to the specified path.
        imwrite(filtered_img, strcat(imagePath, 'maskedImage.png'), 'png');
    end

end
