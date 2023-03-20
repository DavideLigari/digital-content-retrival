function GaussianNoiseReductionv2(image)
    % Add Gaussian noise with a mean of 0.001 and variance of 0.002 to the image.
    noisy_img = imnoise(image, 'gaussian', 0.010, 0.002);
    % Apply a wavelet-based denoising filter to the noisy image.
    filtered_img = denoiseGaussian(noisy_img);
    % Display and store the noisy and filtered images.
    showImages(noisy_img, filtered_img);
end

function im_denoised = denoiseGaussian(image)
    % This function applies a wavelet-based denoising filter to an input image.

    % Convert the input image to double precision.
    tmpImm = im2double(image);
    % Apply the wavelet-based denoising filter with a threshold of 3 and a Haar wavelet.
    im_denoised = wdenoise2(tmpImm, 3, "Wavelet", "haar");

end

function showImages(noisy_img, filtered_img, name)
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
