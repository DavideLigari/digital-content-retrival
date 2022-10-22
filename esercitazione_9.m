% es 9
% Write a program to compute the root-mean-square error of a compressed- decompressed
% image.
clear;
[file,path] = uigetfile({'*.tiff;*.jpg;*.png;*.jpeg'},"select an image");
original=imread(strcat(path,file));
imwrite(original,strcat(path,'compressed.jpeg'),'jpeg');
compressed=imread(strcat(path,"compressed.jpeg"),"jpeg");

diff=original - compressed;
diff= nonzeros(diff);
square= power(diff,2);
n=size(square);
sum= sum(square);
mse=sum/n(1);