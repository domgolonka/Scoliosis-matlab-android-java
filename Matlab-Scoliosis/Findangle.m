function [ slope ] = Findangle(pos,corners,image)
top='top';bot='bot';left='left';right='right';
[maxR,~]=size(corners);
temppoint=[0,0]; tempslope=0; slope=0;
if strcmp(pos,top)
    for i=1:2:maxR
        if corners(i,2)<corners(i+1,2)  %top left
            side='left';
            box=Box(corners(i,:)); % create a box around the selected point
            lpoint=Boxcheck(temppoint,box,image,side,pos);
            side='right';
            box=Box(corners(i+1,:)); % create a box around the selected point
            rpoint=Boxcheck(temppoint,box,image,side,pos);
        end
        if corners(i,2)>corners(i+1,2)  %top left
            side='right';
            box=Box(corners(i,:)); % create a box around the selected point
            rpoint=Boxcheck(temppoint,box,image,side,pos);
            side='left';
            box=Box(corners(i+1,:)); % create a box around the selected point
            lpoint=Boxcheck(temppoint,box,image,side,pos);
        end
    tempslope=(rpoint(1)-lpoint(1))/(rpoint(2)-lpoint(2));
    if slope<abs(tempslope)
        slope=tempslope;
    end
    end
end
if strcmp(pos,bot)
    for i=1:2:maxR
        if corners(i,2)<corners(i+1,2)  %top left
            side='left';
            box=Box(corners(i,:)); % create a box around the selected point
            lpoint=Boxcheck(temppoint,box,image,side,pos);
            side='right';
            box=Box(corners(i+1,:)); % create a box around the selected point
            rpoint=Boxcheck(temppoint,box,image,side,pos);
        end
        if corners(i,2)>corners(i+1,2)  %top left
            side='right';
            box=Box(corners(i,:)); % create a box around the selected point
            rpoint=Boxcheck(temppoint,box,image,side,pos);
            side='left';
            box=Box(corners(i+1,:)); % create a box around the selected point
            lpoint=Boxcheck(temppoint,box,image,side,pos);
        end
        tempslope=(rpoint(1)-lpoint(1))/(rpoint(2)-lpoint(2));
         if slope<abs(tempslope)
                slope=tempslope;
         end
   end
end
end
