function [ newim ] = Contspine( image )
if ischar(image)==1
    image=imsharpen(rgb2gray(imread(image)));
end
imshow(image); title('Adjudt contrast until Vertebrae are easily distinguishable')          
%Displays the image
imcont=imcontrast(gca);  
%imcont is the handle for the process,  
%and gca is the handle for the image
waitfor(imcont);         
%pauses the process until the contrast window is closed
newim=getimage(gca);     
%saves the new image from imcontrast
end

