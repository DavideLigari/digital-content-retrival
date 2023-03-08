function blurImage(grayImage,binaryImage)
    % take outside region 
    sigma = 5;
    blurredImage=grayImage;
    blurredImage = imgaussfilt(blurredImage, sigma);
    outsideMasked = blurredImage;
    outsideMasked(~binaryImage) = 0;

    % take the inside blurred region 
    insideMasked = grayImage;
    insideMasked(binaryImage) = 0;

    blurryImage = imadd(insideMasked,outsideMasked);
    subplot(1,3,2)
    imshow(blurryImage);
    title('Blurred Inside Region');
end

