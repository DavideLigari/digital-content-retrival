% check if the image is RGB
function rgb = isRGB(mat)
    rgb=false;
    tmp=size(size(mat));
    if(tmp(2)==3)
        rgb=true;
    end
end