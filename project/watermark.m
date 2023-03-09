function watermark_image(image_path)
% Load the asset image
asset_image = imread(image_path);

% Convert the asset image to double precision for processing
asset_image = im2double(asset_image);

% If the asset image is RGB, convert it to YCbCr color space and use the Y channel
if size(asset_image, 3) == 3
    asset_image = rgb2ycbcr(asset_image);
    asset_image = asset_image(:, :, 1);
end

% Generate a random Gaussian spread spectrum noise
watermark_signal = randn(1, 1000);

% Apply DCT to the asset image
dct_image = dct2(asset_image);

% Flatten the DCT coefficients into a vector
dct_vector = reshape(dct_image, [], 1);

% Sort the DCT coefficients in descending order
[~, sorted_indices] = sort(abs(dct_vector), 'descend');

% Determine the indices of the 1000 largest coefficients (excluding DC term)
watermark_indices = sorted_indices(2:1001);

% Embed the watermark signal into the selected DCT coefficients
dct_vector(watermark_indices) = dct_vector(watermark_indices) + watermark_signal';

% Reshape the modified DCT coefficients back into a matrix
modified_dct_image = reshape(dct_vector, size(dct_image));

% Set the DC term to its original value
modified_dct_image(1,1) = dct_image(1,1);

% Apply inverse DCT to obtain the watermarked image
watermarked_image = idct2(modified_dct_image);

% If the asset image was RGB, convert the watermarked image back to RGB
if size(asset_image, 3) == 3
    watermarked_image = ycbcr2rgb(watermarked_image);
end

% Display the watermarked image
imshow(watermarked_image);

% Load the watermarked image
watermarked_image = imread('watermarked_image.jpg');

% If the watermarked image is RGB, convert it to YCbCr color space and use the Y channel
if size(watermarked_image, 3) == 3
    watermarked_image = rgb2ycbcr(watermarked_image);
    watermarked_image = watermarked_image(:, :, 1);
end

% Apply DCT to the watermarked image
dct_image = dct2(watermarked_image);

% Flatten the DCT coefficients into a vector
dct_vector = reshape(dct_image, [], 1);

% Retrieve the watermark signal from the selected DCT coefficients
watermark_signal = dct_vector(watermark_indices) - dct_image(watermark_indices);

% Display the retrieved watermark signal
plot(watermark_signal);

% Save the retrieved watermark signal as a file
dlmwrite('retrieved_watermark_signal.txt', watermark_signal);

end
