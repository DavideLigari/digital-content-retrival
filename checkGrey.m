% check if the image is grey level,
% in case it isn't it returns the grey level one

function mat = checkGrey(mat)
    tmp=size(size(mat));
    if(tmp(2)==3)
        mat=rgb2gray(mat);
    end
end