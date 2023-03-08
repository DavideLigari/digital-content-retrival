% ES 29 - 30
% Choose a gray level image and create ten compressed version using jpeg format (hint:use
% imwrite function with the format jpeg and increasing quality factor, from 10 to 100). Then
% compute the psnr (between the original image and the compressed versions) and plot it
% versus the image quality of jpeg.
% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
image = imread(strcat(path, file));

% create 10 images with different quality factor in format jpeg
for i = 10:+10:100
    imwrite(image, strcat(path, sprintf('image_jpeg_%i.jpeg', i)), "Quality", i);
end

figure(1)

% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));
set(get(gca, 'Title'), 'String', sprintf('jpeg compressed images '));

for i = 10:+10:100
    A = imread(strcat(path, sprintf('image_jpeg_%i.jpeg', i)));
    subplot(2, 5, i / 10)
    imshow(A);
    set(get(gca, 'Title'), 'String', sprintf('jpeg compressed image with quality factor %i \n SSIM : %0.2f', i, ssim(A, image)));

end

for i = 10:+10:100
    filename = strcat(path, sprintf('image_jpeg_%i.jpeg', i));
    delete (filename);
end

% create 10 images with different quality factor in format jpeg2000
for i = 10:+10:100
    imwrite(image, strcat(path, sprintf('image_jpeg_%i.j2k', i)), "CompressionRatio", i);
end

figure(2)

% Maximize figure.
set(gcf, 'Position', get(0, 'Screensize'));
set(get(gca, 'Title'), 'String', sprintf('jpeg2000 compressed images '));

for i = 10:+10:100
    A = imread(strcat(path, sprintf('image_jpeg_%i.j2k', i)));
    subplot(2, 5, i / 10)
    imshow(A);
    set(get(gca, 'Title'), 'String', sprintf('jpeg2000 compressed image with quality factor %i \n SSIM : %0.2f', i, ssim(A, image)));

end

for i = 10:+10:100
    filename = strcat(path, sprintf('image_jpeg_%i.j2k', i));
    delete (filename);
end
