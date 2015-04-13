function [] = Cobbs(~)
image=imsharpen(rgb2gray(imread('USETHISONE.jpg')));
if ischar(image)==1
    image=imsharpen(rgb2gray(imread(image)));
end
A=image;
for i=1:length(A(:,1))*length(A(1,:))
if image(i)>=188
A(i)=255;
else
A(i)=0;
end
end
addit=0;
if round(mean(mean(A)))<35
    addit=35-round(mean(mean(A)));
    for i=1:length(A(:,1))*length(A(1,:))
        A(i)=A(i)+ addit;
    end
end
corners=detectHarrisFeatures(A);
[~, valid_corners]=extractFeatures(A,corners);
figure; imshow(A); hold on
plot(valid_corners);

%% HAS TO BE ABLE TO READ COORDINATES FROM A TEXT FILE
%AND BE ABLE TO DETERMINE TOP BOTTOM AND EXAMPLE

%save it all to a vector

%if list(1)<200

fid=fopen('coordinates.txt','r');
tline=fgetl(fid);
for i =1:length(tline)
    if tline(i)=='{' || tline(i)=='=' || tline(i)==',' || tline(i)=='}'
        tline(i)=0;
    end
end
newline=str2num(tline);
stpoint=vertcat(newline(2:3),newline(5:6),newline(8:9),newline(11:12),newline(14:15));

bstpoint=[]; tstpoint=[];
for i=2:length(stpoint(:,1))
    if stpoint(i,1)>stpoint(i-1,1)+100
        bstpoint=vertcat(tstpoint,stpoint(i:end-1,:));
        tstpoint=vertcat(bstpoint,stpoint(1:i-1,:));
        end
end

eX=stpoint(end,1);
eY=stpoint(end,2);

%figure
%imshow(image),title('Click the centres of suspected vertebrae')
%[tY,tX]=getpts;

%if list(1)>200

%figure,imshow(image),title('Click the bottom corners of suspected lower vertebrae')
%[bY,bX]=getpts;

%list(end,:)

%figure,imshow(image),title('Click the best example vertebrae')
%[eY,eX]=getpts;
%eX=round(eX);eY=round(eY);



%%

%close all
top=[]; top(1:11,1)=eX; top(:,2)=[eY-5:eY+5];
bot=[]; bot(1:11,1)=eX; bot(:,2)=[eY-5:eY+5];
%figure;
%imshow(A)
%hold on
%plot([top(1,2),top(11,2)],[top(1,1),top(1,1),],'color','y','LineWidth',2)
%hold on


topfound=false; tophit=false;
botfound=false; bothit=false;
while topfound==false
    top(:,1)=top(:,1)-1;
    sumtop=0; 
    for i=1:length(top)
        sumtop=sumtop+A(top(i,1),top(i,2))/255;
    end 
    if sumtop>=6
        tophit=true;
    end
    if sumtop<4 && tophit==true
        topfound=true;
        top(:,1)=top(:,1)+1;
    end
end
while botfound==false
    bot(:,1)=bot(:,1)+1;
    sumbot=0; 
    for i=1:length(bot)
        sumbot=sumbot+A(bot(i,1),bot(i,2))/255;
    end 
    if sumbot>=6
        bothit=true;
    end
    if sumbot<4 && bothit==true
        botfound=true;
        bot(:,1)=bot(:,1)-1;
    end
end

%plot([top(1,2),top(11,2)],[top(1,1),top(1,1),],'color','y','LineWidth',2)
%hold on
%plot([bot(1,2),bot(11,2)],[bot(1,1),bot(1,1),],'color','y','LineWidth',2)
%hold on
right=[]; right(:,1)=[top(1):top(1)+3]; right(:,2)=[eY];
left=[]; left(:,1)=[top(1):top(1)+3]; left(:,2)=[eY];
%plot([left(1,2),left(4,2)],[left(1,1),left(4,1),],'color','y','LineWidth',2)
%hold on
rightfound=false; righthit=false;
leftfound=false; lefthit=false;        
while rightfound==false
    right(:,2)=right(:,2)+1;
    sumright=0; 
    for i=1:length(right)
        sumright=sumright+A(right(i,1),right(i,2))/255;
    end 
    if sumright>=2
        righthit=true;
    end
    if sumright<1 && righthit==true
        rightfound=true;
        right(:,2)=right(:,2)-1;
    end
end
while leftfound==false
   left(:,2)=left(:,2)-1;
   sumleft=0; 
    for i=1:length(left)
        sumleft=sumleft+A(left(i,1),left(i,2))/255;
    end 
    if sumleft>=2
        lefthit=true;
    end
    if sumleft<1 && lefthit==true
        leftfound=true;
        left(:,2)=left(:,2)+1;
    end
end
plot([left(1,2),left(4,2)],[left(1,1),left(4,1),],'color','y','LineWidth',2)
hold on
plot([right(1,2),right(4,2)],[right(1,1),right(4,1),],'color','y','LineWidth',2)
hold on
l=right(1,2)-left(1,2);
w = bot(1,1)-top(1,1);

vertsize=[l, w];
vert_angle=radtodeg(atan((vertsize(1,2)/(vertsize(1,1)))));

[vertangletop]=Angle(tstpoint,'top',A, vertsize, vert_angle,valid_corners);
[vertanglebot]=Angle(bstpoint,'bot',A, vertsize, vert_angle,valid_corners);


%topline
if vertangletop(2)>vertangletop(4)
    topopp=vertangletop(4)-vertangletop(2);
    topadj=vertangletop(5)-vertangletop(3);
    topst=[vertangletop(4),vertangletop(5)];
    topend=[vertangletop(2),vertangletop(3)];
else 
    topopp=vertangletop(5)-vertangletop(3);
    topadj=vertangletop(4)-vertangletop(2); 
    topst=[vertangletop(2),vertangletop(3)];
    topend=[vertangletop(4),vertangletop(5)];
end
topline=[topopp,topadj];



%botline
if length(vertanglebot)>5  % used the diagonal opposite corner points
    botopp=vertanglebot(4)-vertanglebot(6);
    botadj=vertanglebot(5)-vertanglebot(7);
    botst=[vertanglebot(4),vertanglebot(5)];
    botend=[vertanglebot(6),vertanglebot(7)];
else  %less than 5 (meaning it used the top two edges
    botopp=vertanglebot(5)-vertanglebot(3);
    botadj=vertanglebot(4)-vertanglebot(2); 
    botst=[vertanglebot(2),vertanglebot(3)];
    botend=[vertanglebot(4),vertanglebot(5)];
end
botline=[botopp,botadj];



while topend(1)<(botend(1)-botline(1))
    botend=botend-botline;
    topend=topend-topline;
end
while topend(1)<botend(1)
    botend=round(botend-botline/10);
    topend=round(topend-topline/10);
end
if topend(2)>botend(2)
    while topend(2)>botend(2)
     topend=topend-topline;
    end
else
    while botend(2)>topend(2)
     botend=botend-botline;
    end
end

%DRAWS THE IMAGE
figure;
imshow(image)

figure;
imshow(image)
hold on
plot([botend(2),botst(2)],[botend(1),botst(1),],'color','y','LineWidth',2)


figure;
imshow(image)
hold on
plot([topend(2),topst(2)],[topend(1),topst(1),],'color','y','LineWidth',2)


%ACTUAL COBBS ANGLE

Cobbangle=abs(vertangletop(1))+abs(vertanglebot(1));


RGB=insertText(image,[length(image(1,:))/2,length(image(:,1))*3/4 ], Cobbangle,'BoxColor','yellow','AnchorPoint','Center','FontSize',38);
    
Cobbsimage=figure;    
imshow(RGB)
hold on
plot([botend(2),botst(2)],[botend(1),botst(1),],'color','y','LineWidth',2)
hold on
plot([topend(2),topst(2)],[topend(1),topst(1),],'color','y','LineWidth',2)
saveas(Cobbsimage,'Cobb','jpg')


end

