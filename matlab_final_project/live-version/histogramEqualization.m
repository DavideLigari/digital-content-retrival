function histogramEqualization(image)   
    % Apply histogram equalization to the image.
    image_eq = histeq(image);

    % Display the equalized image.
    subplot(1,2,1)
    title('original image')
    imshow(image)
    subplot(1,2,2)
    title('equalized image')
    imshow(image_eq)
