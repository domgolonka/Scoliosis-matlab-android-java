function [ box ] = Box(corner )
tl=corner(1,:)+[-2,-2];
tr=corner(1,:)+[-2,2];
bl=corner(1,:)+[2,-2];
br=corner(1,:)+[2,2];
box=[tl;tr;bl;br];
end

