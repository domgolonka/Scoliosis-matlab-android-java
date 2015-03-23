function [ newim ] = Formatspine( image )
if ischar(image)==1 %test whether input is a matrix or file
    image=imread(image);
end
image=rgb2gray(image);
for i=1:3
image=imsharpen(image); %sharpen the image
end
image=Cropspine(image); %crop the image
image=Isolatespine(image); %eliminate background
newim=Contspine(image); %change the contrast
end