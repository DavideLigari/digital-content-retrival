% This function displays and analyzes various image information such as
% histograms, mean intensity, contrast, and entropy.
% It takes an image and its path as input arguments.
function imageInformationsv2(image)
    % Check if the image is RGB.
    if isRGB(image)
        % Extract each color channel.
        Red = image(:, :, 1);
        Green = image(:, :, 2);
        Blue = image(:, :, 3);

        % Calculate the histogram of each channel.
        [yRed, x1] = imhist(Red);
        [yGreen, x2] = imhist(Green);
        [yBlue, x3] = imhist(Blue);

        % Display the histogram of each channel.
        subplot(2,1,1)
        plot(x1, yRed, 'Red', x2, yGreen, 'Green', x3, yBlue, 'Blue');
        title('Histogram of the image ', 'FontSize', 1);

        % Calculate the mean intensity for each channel.
        red_mean = mean(Red, 'all');
        green_mean = mean(Green, 'all');
        blue_mean = mean(Blue, 'all');

        % Calculate the contrast for each channel.
        red_contrast = range(Red(:));
        green_contrast = range(Green(:));
        blue_contrast = range(Blue(:));

        % Calculate the entropy of the image.
        imageEntropy = entropy(image);

        % Display the image information such as entropy, mean intensity,
        % and contrast for each channel.
              % Display the image information such as entropy, mean intensity,
        % and contrast for each channel.
        subplot(2, 1, 2);
        txt = sprintf('Entropy : %.4f \nRed channel mean intensity : %.2f\nGreen channel mean intensity : %.2f\nBlue channel mean intensity : %.2f\nRed channel contrast : %.2f\nGreen channel contrast : %.2f\nBlue channel contrast : %.2f\n', imageEntropy, red_mean, green_mean, blue_mean, red_contrast, green_contrast, blue_contrast);
        text(0.5, 0.5, txt, "FontSize", 45); axis off

    else
        % Calculate the histogram of the grayscale image.
        [y, x] = imhist(image);

        % Display the histogram of the grayscale image.
        subplot(2, 1, 1);
        title('Histogram of the image ', 'FontSize', 1);
        plot(x, y);

        % Calculate the entropy, mean intensity, and contrast of the grayscale image.
        imageEntropy = entropy(image);
        meanImage = mean(image, 'all');

        % Display the image information such as entropy, mean intensity,
        % and contrast of the grayscale image.
        subplot(2, 1, 2);
        txt = sprintf('Entropy : %.4f\nMean intensity : %.2f\nContrast : %.2f\n', imageEntropy, meanImage);
        text(0.5, 0.5, txt, "FontSize", 45); axis off
    end

end
