% This function checks if an input matrix is a grayscale or RGB image.
% If the input matrix is an RGB image, it converts it to grayscale.
% Input: mat - the matrix to be checked
% Output: mat - the grayscale image if the input matrix is RGB, the original matrix otherwise

function mat = checkGrey(mat)
    tmp = size(size(mat));

    % Check if the input matrix is an RGB image
    if (tmp(2) == 3)
        % Convert RGB image to grayscale
        mat = rgb2gray(mat);
    end

end
