function [ newim ] = Cropspine( image )
if ischar(image)==1
    image=imsharpen(rgb2gray(imread(image)));
end
figure;    
%Needed to include the title
imshow(image)  
%Displays the image
title({'Select region and double click inside'}) 
%Instructions for user
newim=imcrop;   
%actual cropping function
end

