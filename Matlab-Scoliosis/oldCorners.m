function [left, right] = oldCorners(figure,start)
left=start; right=start;
li=left(1); lj=left(2);
ri=right(1); rj=right(2);
if figure(start)==0
    while figure(li,lj)==0
        li=li-1;
    end
    left=[li,lj]
    while figure(ri,rj)==0
        ri=ri+1;
    end
    right=[ri,rj]
end
while figure(li,lj)==1
    li=li-1;
end

while figure(ri,rj)==1
    ri=ri+1;
end
left=[li,lj];
right=[ri,rj];
