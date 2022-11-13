% this function modifies the size of an image
% so its dimensions are a multiple of n,
% it will be used to divide the image in NxN blocks

function [image, numBlocks] = resizeImage(image, dimBlock)
    dim = int16(size(image));
    numBlocks = idivide(dim, dimBlock);
    newDim = numBlocks * 8;
    image = image(1:newDim(1), 1:newDim(2));
end
