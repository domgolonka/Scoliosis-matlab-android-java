function [ Cangle ] = Cobbs(image)
if ischar(image)==1
    image=imsharpen(rgb2gray(imread(image)));
end
figure
imshow(image),title('Click the top corners of suspected upper vertebrae')

[tY,tX]=getpts;
tcorners=[tX,tY];
figure,imshow(image),title('Click the bottom corners of suspected lower vertebrae')
[bY,bX]=getpts;
bcorners=[bX,bY];

topangle=Findangle('top',tcorners,image);
botangle=Findangle('bot',bcorners,image);

Cangle=[topangle,botangle];

%Cangle= analysis
end

