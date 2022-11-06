% ES 10
% Download an image (if color image, perform a conversion to a gray level image) and write
% the code which computes the entropy. Compare the computed value to the value provided
% by the built-in MATLAB function entropy.

% Clear command window.
clc;
% Delete all variables.
clear;
% Close all figure windows except those created by imtool.
close all;
% Close all figure windows created by imtool.
imtool close all;

[file, path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'}, "select an image");
original = imread(strcat(path, file));
% convert the image to grey levels
image = checkGrey(original);
% calculate the number of pixels
n = size(image);
n = n(1) * n(2);

% get the number of pixels for each values and the probability of all
% values
[counts, x] = imhist(image);
prob = counts ./ n;

% calculate the entropy, excluding the values with probability=0,
% because log(0) is NaN
calculatedEntropy = 0;

for i = 1:256

    if (prob(i) ~= 0)
        calculatedEntropy = calculatedEntropy + (prob(i) * (log2(prob(i))));
    end

end

calculatedEntropy = -calculatedEntropy;
%it calculate the entropy using the matlab function
expectedEntropy = entropy(image);

%compare the the two entropy obtaied
diff= expectedEntropy -calculatedEntropy;


