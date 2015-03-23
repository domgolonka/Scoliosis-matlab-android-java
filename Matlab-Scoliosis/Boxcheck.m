function [ temppoint ] = Boxcheck(temppoint,box,image,side,pos)
top='top';bot='bot';left='left';right='right';
tl=box(1,:); side
bl=box(3,:); pos
br=box(4,:);
if strcmp(pos,top)
    if strcmp(side,left)fvvv
            display('top left')
        tl
        bl
        br
        for n=tl(1):bl(1)    %iterate through the pixels in the Box region
                for m=bl(2):br(2)  
                    m=round(m);
                    if temppoint(1)==0||(image(n,m)>=200&& n<temppoint(1) && m<temppoint(2))
                        temppoint=[n,m];  %find the highest leftmost pixel
                    end
                    if temppoint(2)==bl(2)
                        tempcorners=Box([n,m]);
                        temppoint=Boxcheck(temppoint,tempcorners,image,side,pos);
                    end  %recursive in case the box needs to be shifted
                end  %next row
        end
    end
     if strcmp(side,right)
             display('top right')
        for n=tl(1):bl(1)    %iterate through the pixels in the Box region
                for m=bl(2):br(2)  
                    m=round(m);
                    if temppoint(1)==0||(image(n,m)>=200&& n<temppoint(1) && m>temppoint(2))
                        temppoint=[n,m];  %find the highest most right pixel
                    end
                    if temppoint(2)==br(2)
                        tempcorners=Box([n,m]);
                        temppoint=Boxcheck(temppoint,tempcorners,image,side,pos);
                    end  %recursive in case the box needs to be shifted
                end  %next row
        end
     end
end
if strcmp(pos,bot)
    display('bot left')
    if strcmp(side,left)
        for n=tl(1):bl(1)   %iterate through the pixels in the Box region
                for m=bl(2):br(2)  
                    m=round(m);
                    if temppoint(1)==0||(image(n,m)>=200&& n>temppoint(1) && m<temppoint(2))
                        temppoint=[n,m]  %find the highest leftmost pixel
                    end
                    if temppoint(2)==bl(2)
                        tempcorners=Box([n,m]);
                        temppoint=Boxcheck(temppoint,tempcorners,image,side,pos)
                    end  %recursive in case the box needs to be shifted
                end  %next row
        end
    end
     if strcmp(side,right)
         display('bot right')
        for n=tl(1):bl(1)    %iterate through the pixels in the Box region
                 for m=bl(2):br(2)  
                     m=round(m);
                    if temppoint(1)==0||(image(n,m)>=200&& n>temppoint(1) && m>temppoint(2))
                        temppoint=[n,m];  %find the highest most right pixel
                    end
                    if temppoint(2)==br(2)
                        tempcorners=Box([n,m]);
                        temppoint=Boxcheck(temppoint,tempcorners,image,side,pos);
                    end  %recursive in case the box needs to be shifted
                end  %next row
        end
     end
end


