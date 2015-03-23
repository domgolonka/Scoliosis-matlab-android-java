function [ newim ] = Isolatespine(image)
if ischar(image)==1
    image=imsharpen(rgb2gray(imread(image)));
end 
%Test whether 'image' is a matrix or filename then load the image 
%change it to a 2D greyscale matrix & sharpen the image
ig=imshow(image);title('Trace the spine in a closed loop') 
% Displays the image in a figure with the handle 'ig'
h=imfreehand;  
% Allows the user to draw on the image to select a region
BW=createMask(h,ig); 
% Creates a logical matrix where the inside 
% of the region is 1's and everywehere else is 0's
BW=uint8(BW);        
%converts the logical matrix into an integer matrix with the same values
newim=image.*BW;         
%multiplies the old image by the mask BW to isolate the wanted region
end

