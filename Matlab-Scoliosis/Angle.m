function [ finalangle ] = Angle( stpoint,pos,A,vertsize,vertangle,valid_corners )
%from start point: go up, down and to both sides looking for white
%pixels/edges (value=1), if under a certain amount contineue for a little
%bit, after a certain amount if any spots are found continue out a little
%bit and if nothing is found then go back test what is found and look for
%how it goes with the corners values
angles=zeros(length(stpoint(:,1)),1); bot='bot'; TOP='top';
l=vertsize(1); w=vertsize(2);
for n=1:length(stpoint(:,1))
   %%
   %Find the isolated region of the image with the vertebrae of interest
   %Plot both the image and the corner points on the new image isol

   strow=stpoint(n,1); stcol=stpoint(n,2);
    isol=zeros(length(A(:,1)),length(A(1,:)));
    for i=strow-w:(strow+w)
       for j=stcol-l:(stcol+l)
        isol(i,j)=A(i,j);
       end
    end
    cornerpts=[];
    for k=1:length(valid_corners)
        % Find the corner points in the isolated region, their xy values
        % are reversed
        if valid_corners.Location(k,2)>=strow-w && valid_corners.Location(k,2)<=strow+w
            if valid_corners.Location(k,1)>=stcol-l && valid_corners.Location(k,1)<=stcol+l
                cornerpts=horzcat(cornerpts,k);
            end
        end
    end
    
    %%  PLOT the isolated image if you want to see it
    figure; imshow(isol); hold on
    for i=1:length(cornerpts)
        plot(valid_corners(cornerpts(i))); hold on
    end    

%% FINDING THE CORNERS
%test the corner points for the approximate distance needed

%% Bottom vertebrae
if strcmp(pos,bot)

lpoint=stpoint(n,:); rpoint =stpoint(n,:);

%Find the left sidefirst
%starts at the selected point
lhit=false; lfound=false;
hit=0; 
while lfound==false  
    lpoint(1,2)=lpoint(1,2)-1; % move to the left
    if isol(lpoint(1,1),lpoint(1,2))==255
        lhit=true;
    end
    if lhit==true && isol(lpoint(1,1),lpoint(1,2))==0
        hit=hit+1;  %hit white pixels (ie. bone)
    end
    if lhit==true && isol(lpoint(1,1),lpoint(1,2))==255 && hit>0
        hit=0; %bone wasn't at the corner, must keep goin
    end
    %If it thinks it found the side and keeps going without running into
    %anything then it goes back to where it found the side
    if lhit==true && isol(lpoint(1,1),lpoint(1,2))==0 && hit>=7
        lfound=true; lpoint(1,2)=lpoint(1,2)+7;  
    end
end
while isol(lpoint(1,1)-1,lpoint(1,2))==255
    %travels up the bone until it hits an upper edge
    %in case it hits the bottom of teh vertebrae
    lpoint(1,1)=lpoint(1,1)-1;   
end
lfound=false;
while lfound==false 
    %moves its way down the vertebrae towards 
    %the bottom left corner along the edge of the vertebrae
    if isol(lpoint(1,1),lpoint(1,2)-1)==255
        lpoint(1,2)=lpoint(1,2)-1;
    
    else if  isol(lpoint(1,1)+1,lpoint(1,2))==255
            lpoint(1,1)=lpoint(1,1)+1;
    
    else if isol(lpoint(1,1)+1,lpoint(1,2)-1)==0 && isol(lpoint(1,1)+2,lpoint(1,2))==255
        lpoint(1,1)=lpoint(1,1)+2;
        lpoint(1,2)=lpoint(1,2);
    else if isol(lpoint(1,1)+1,lpoint(1,2)-1)==0
        lfound=true;
        end
        end
        end
    end
end
ltop_pt=lpoint;
lfound=false;
while lfound==false
    %travels up the side to find the top left corner of the verterbrae
    while isol(ltop_pt(1,1)-1,ltop_pt(1,2))==255
        ltop_pt(1,1)=ltop_pt(1,1)-1;
    end
    if isol(ltop_pt(1,1),ltop_pt(1,2)+1)==255
        ltop_pt(1,2)=ltop_pt(1,2)+1;
    
    else if isol(ltop_pt(1,1)-1,ltop_pt(1,2)+1)==255 && isol(ltop_pt(1,1)-1,ltop_pt(1,2))==0
        ltop_pt(1,1)=ltop_pt(1,1)-1;ltop_pt(1,2)=ltop_pt(1,2)+1;
    
    else if isol(ltop_pt(1,1)-2,ltop_pt(1,2))==255 && isol(ltop_pt(1,1)-1,ltop_pt(1,2))==0
        ltop_pt(1,1)=ltop_pt(1,1)-2;
    else if isol(ltop_pt(1,1)-1,ltop_pt(1,2)+2)==255 && isol(ltop_pt(1,1)-1,ltop_pt(1,2)-1)==0
        ltop_pt(1,1)=ltop_pt(1,1)-1;ltop_pt(1,2)=ltop_pt(1,2)+2;
    
    else if isol(ltop_pt(1,1)-2,ltop_pt(1,2))==0 && isol(ltop_pt(1,1)-1,ltop_pt(1,2)+1)==0 && isol(ltop_pt(1,1)-1,ltop_pt(1,2))==0
        lfound=true;
        end
        end
        end
        end
    end
end

% Now it finds the right top corer of the vertebrae
% Same as left but it goes for the top corner
rhit=false; rfound=false;
hit=0;
while rfound==false
    rpoint(1,2)=rpoint(1,2)+1;
    if isol(rpoint(1,1),rpoint(1,2))==255
        rhit=true;
    end
    if rhit==true && isol(rpoint(1,1),rpoint(1,2))==0
        hit=hit+1;
    end
    if rhit==true && isol(rpoint(1,1),rpoint(1,2))==255 && hit>0
        hit=0;
    end
    if rhit==true && isol(rpoint(1,1),rpoint(1,2))==0 && hit>=7
        rfound=true; rpoint(1,2)=rpoint(1,2)-7;
    end
end
while isol(rpoint(1,1)-1,rpoint(1,2))==255
    rpoint(1,1)=rpoint(1,1)-1;
end
rfound=false; 
while rfound==false
    if isol(rpoint(1,1),rpoint(1,2)+1)==255
        rpoint(1,2)=rpoint(1,2)+1;
    else if  isol(rpoint(1,1)-1,rpoint(1,2))==255
        rpoint(1,1)=rpoint(1,1)-1;
        
    else if  isol(rpoint(1,1),rpoint(1,2)+2)==255
        rpoint(1,2)=rpoint(1,2)+2; 
    else if  isol(rpoint(1,1)-2,rpoint(1,2))==255
        rpoint(1,1)=rpoint(1,1)-2;
    else if  isol(rpoint(1,1)-3,rpoint(1,2))==255
        rpoint(1,1)=rpoint(1,1)-3;
    else if isol(rpoint(1,1)+1,rpoint(1,2)+1)==255
                rpoint(1,1)=rpoint(1,1)+1;
                rpoint(1,2)=rpoint(1,2)+1;
    else if isol(rpoint(1,1)+1,rpoint(1,2)+2)==255
                rpoint(1,1)=rpoint(1,1)+1;
                rpoint(1,2)=rpoint(1,2)+2;
    else if isol(rpoint(1,1)-4,rpoint(1,2))==255
                rpoint(1,1)=rpoint(1,1)-4;

        else
                 rfound=true;
        end
        end
        end
        end
        end
        end
        end
    end
   
end


% Pick which angle to use:
if pdist([lpoint;rpoint],'euclidean')<=sqrt(l^2+w^2)*1.15 && pdist([lpoint;rpoint],'euclidean')>=sqrt(l^2+w^2)*0.85
    %diagonal points (b.left->t.right)
    angles(n,1)=radtodeg(atan((lpoint(1,1)-rpoint(1,1))/(rpoint(1,2)-lpoint(1,2))));
    radangle=atan((lpoint(1,1)-rpoint(1,1))/(rpoint(1,2)-lpoint(1,2)));
    angles(n,1)=angles(n,1)-vertangle;
    
    
    %have to find the top left corner via 
    angles(n,2:3)=lpoint(1,1:2); 
    angles(n,4:5)=rpoint(1,1:2);
    angles(n,6:7)=ltop_pt(1:2);
else if pdist([lpoint;ltop_pt],'euclidean')<=w*1.15 && pdist([lpoint;ltop_pt],'euclidean')>=w*0.85
        %left edge
        angles(n,1)=radtodeg(atan((ltop_pt(1,2)-lpoint(1,2))/(lpoint(1,1)-ltop_pt(1,1))));
        angles(n,2:3)=lpoint(1,1:2); 
        angles(n,4:5)=ltop_pt(1,1:2);
        
        
        
        %have to find the top right corner
     end
end





%Put in a test to see which angle to use
%top=[]; top(1:11,1)=stpoint(n,1); top(:,2)=[stpoint(n,2)-5:stpoint(n,2)+5];
%topfound=false; tophit=false;
%while topfound==false
%    top(:,1)=top(:,1)-1;
%    sumtop=0; 
%    for i=1:length(top)
%        sumtop=sumtop+A(top(i,1),top(i,2))/255;
%    end 
%    if sumtop>=4
%        tophit=true;
%    end
%    if sumtop<4 && tophit==true
%        topfound=true;
%        top(:,1)=top(:,1)+1;
%    end
%end

end

%%
if strcmp(pos,TOP)
%IF TOP VERTEBRAE

tpoint=stpoint(n,:); %assign the point looking for the top edge to the point selected earlier
%from cobbs
top=[]; top(1:21,1)=tpoint(1,1); top(:,2)=tpoint(1,2)-10:tpoint(1,2)+10;
topfound=false; tophit=false; k=0; m=0;
while topfound==false && top(1,1)~=1
    top(:,1)=top(:,1)-1;
    sumtop=0; 
    for i=1:length(top)
        sumtop=sumtop+A(top(i,1),top(i,2))/255;
    end 
    if sumtop>=3 % found pixels that could be part of the edge
        tophit=true; k=k+1;
    end
    if tophit==true && sumtop<3
        m=m+1;
    end
    if sumtop==0
        k=0;
    end
    if tophit==true && sumtop==255 && k>3
       topfound=true; 
    end
    if tophit==true && m>=3
        top(:,1)=top(:,1)+3;
        topfound=true;
    end
    if k>=3 && tophit==true
        topfound=true;
        top(:,1)=top(:,1)+1;
    end
end

if top(1,1)==1
    tpoint=stpoint(n,:); %assign the point looking for the top edge to the point selected earlier
%from cobbs
top=[]; top(1:41,1)=tpoint(1,1); top(:,2)=tpoint(1,2)-20:tpoint(1,2)+20;
topfound=false; tophit=false; k=0; m=0;
while topfound==false && top(1,1)~=0
    top(:,1)=top(:,1)-1;
    sumtop=0; 
    for i=1:length(top)
        sumtop=sumtop+A(top(i,1),top(i,2))/255;
    end 
    if sumtop>=3 % found pixels that could be part of the edge
        tophit=true; k=k+1;
    end
    if tophit==true && sumtop<3
        m=m+1;
    end
    if sumtop==0
        k=0;
    end
    if tophit==true && sumtop==255 && k>5
       topfound=true; 
    end
    if tophit==true && m>=4
        top(:,1)=top(:,1)+4;
        topfound=true;
    end
    if k>=3 && tophit==true
        topfound=true;
        top(:,1)=top(:,1)+1;
    end
end
end

distpt=20;Loc=0; temp=0;  %find the corner point closest to the tpoint
 for i=1:length(cornerpts)
     temp=cornerpts(i);
        if distpt>pdist([valid_corners.Location(temp,2),valid_corners.Location(temp,1);top(end,1),top(end,2)],'euclidean');
            distpt=pdist([valid_corners.Location(temp,2),valid_corners.Location(temp,1);top(end,1),top(end,2)],'euclidean');
            Loc=cornerpts(i); 
        end
 end
 
 
 tpoint=round([valid_corners.Location(Loc,2),valid_corners.Location(Loc,1)]);
 tfound=false;
 
while tfound==false
    if isol(tpoint(1,1),tpoint(1,2)+1)==255
        tpoint(1,2)=tpoint(1,2)+1;
    end
    if  isol(tpoint(1,1),tpoint(1,2)+2)==255
        tpoint(1,2)=tpoint(1,2)+2;
    end
    if isol(tpoint(1,1)-1,tpoint(1,2))==255
        tpoint(1,1)=tpoint(1,1)-1;
    end
    if isol(tpoint(1,1)-1,tpoint(1,2)+1)==255
        tpoint(1,2)=tpoint(1,2)+1;
        tpoint(1,1)=tpoint(1,1)-1;
    end
    if isol(tpoint(1,1)-1,tpoint(1,2)+2)==255
        tpoint(1,1)=tpoint(1,1)-1;
        tpoint(1,2)=tpoint(1,2)+2;
    end   
    if isol(tpoint(1,1)-1,tpoint(1,2)+1)==0 && isol(tpoint(1,1)-1,tpoint(1,2)+2)==0 && isol(tpoint(1,1),tpoint(1,2)+1)==0 && isol(tpoint(1,1),tpoint(1,2)+2)==0
        tfound=true;
    end
        
end
 
 
 
tlpoint=[0,0]; ltop=false;
while ltop==false
    for i=1:round(length(top)/4)
        if isol(top(i,1),top(i,2))==255;
          tlpoint=top(i,:);
          ltop=true;
          break
        end
        if i==5 && isol(top(i,1),top(i,2))==0;
          top(:,1)=top(:,1)+1;
        end
    end
end

%from above
tfound=false;
while tfound==false
    if isol(tlpoint(1,1),tlpoint(1,2)-1)==255
        tlpoint(1,2)=tlpoint(1,2)-1;
    end
    if  isol(tlpoint(1,1),tlpoint(1,2)-2)==255
        tlpoint(1,2)=tlpoint(1,2)-2;
    end
    if isol(tlpoint(1,1)+1,tlpoint(1,2))==255
        tlpoint(1,1)=tlpoint(1,1)+1;
    end
    if isol(tlpoint(1,1)+1,tlpoint(1,2)-1)==255
        tlpoint(1,2)=tlpoint(1,2)-1;
        tlpoint(1,1)=tlpoint(1,1)+1;
    end
    if isol(tlpoint(1,1)+1,tlpoint(1,2)-2)==255
        tlpoint(1,1)=tlpoint(1,1)+1;
        tlpoint(1,2)=tlpoint(1,2)-2;
    end   
    if isol(tlpoint(1,1)+1,tlpoint(1,2)-1)==0 && isol(tlpoint(1,1)+1,tlpoint(1,2)-2)==0 && isol(tlpoint(1,1),tlpoint(1,2)-1)==0 && isol(tlpoint(1,1),tlpoint(1,2)-2)==0
        tfound=true;
    end
        
end

    %top left to top right
angles(n,1)=radtodeg(atan((tlpoint(1,1)-tpoint(1,1))/(tpoint(1,2)-tlpoint(1,2))));
angles(n,2:3)=tlpoint(1,1:2); angles(n,4:5)=tpoint(1,1:2);
end
end
%%
finalangle=[];
for i=1:length(angles(:,1))
    mangle=max(abs(angles));
    if mangle(1)==abs(angles(i,1))
        finalangle=angles(i,:);
    end
end



%%
     
%pdist(x,'euclidean') % for finding the distance 
                         % between the corner points


