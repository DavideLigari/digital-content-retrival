% This function takes a matrix as an input and checks if it is an RGB image or not.
% Input: mat - matrix to check
% Output: rgb - boolean value indicating whether the input is an RGB image (true) or not (false).

function rgb = isRGB(mat)
    rgb = false; % initialize rgb variable to false
    tmp = size(size(mat)); % get the size of the input matrix and its dimensions

    if (tmp(2) == 3) % if the dimensions of the matrix are 3 (indicating an RGB image)
        rgb = true; % set the rgb variable to true
    end

end
