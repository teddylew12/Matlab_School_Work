function exploremap(long,lat,elev)
%EXPLOREMAP Creates an interactive map to explore
% This function will take in the data given by the three arrays, X, Y, and
% Z. They must all be arrays of the same dimensions. It will then plot the
% contour map and a surface map and will allow the user to move about the
% contour map using the WASD keys. The user will quit using the Q key. The
% boundary box should not extend beyond the map edges


%Error Checking
if ~(isnumeric(long)&&isnumeric(lat)&&isnumeric(elev))
    error('Non numeric array entered')
end
if ~(size(long)==size(lat)&size(lat)==size(elev)&size(elev)==size(long))
    error('Arrays dont have the same sizes')
end
radius=6371000;
%Creating new matrices to hold the meters values for the map
newlat=zeros(size(lat));
newlong=zeros(size(long));
for iter=2:size(newlong,2)
    newlong(:,iter)=newlong(:,iter-1)+radius*tand(long(:,iter)-long(:,iter-1));
end
for iter=2:size(newlat,1)
    newlat(iter,:)=newlat(iter-1,:)+radius*tand(lat(iter,:)-lat(iter-1,:));
end

figure()

subplot(1,2,1)
%Plots the surface of the map
s=surf(newlong,newlat,elev);

subplot(1,2,2)
%Plots the contour of the map
contour(newlong,newlat,elev)
hold on
%Global Variable for the size of the bounding box
bboxsize=22;
%Global Variable for the movement of the bounding box
move=5;
%Tracker variables for the top and bottom rows, left and right columns of
%the bounding box
currleft=2;
currright=bboxsize;
currtop=2;
currbottom=bboxsize;
%Plots the rectangle
r=rectangle('Position',[newlong(currtop,currleft),newlat(currbottom,currleft),newlong(currtop,currright)-newlong(currtop,currleft),newlat(currtop,currleft)-newlat(currbottom,currleft)],'EdgeColor','r');
axis equal
%Couldn't figure out how to change the surface plots limits correctly.
%Definately didnt help that the instructions told you to use xlim and ylim
%which are not functions of surface plots
s.XData([currleft currright]);
s.YData([currtop currbottom]);

set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
choose = 'n';
while (choose ~= 'q')
    choose = get(gcf,'CurrentCharacter');
    switch choose
        case 's' %the user wants to move south
            
            %Check if the box is near the southern border of the map, and
            %prevents the box from moving past it
            if currbottom+move<=size(long,1)
                tempmove=move;
            %If the box is touching, the box cant move any more
            elseif currbottom==size(long,1)
                tempmove=0;
            %If the box isnt touching, but is less than a full move away,
            %it can only move the remaining distance
            else
                tempmove=size(long,1)-currbottom;
            end
            %Update the tracker columns with the move length
            currtop=currtop+tempmove;
            currbottom=currbottom+tempmove;
            %Update the rectangles position
            r.Position=[newlong(currtop,currleft),newlat(currbottom,currleft),newlong(currtop,currright)-newlong(currtop,currleft),newlat(currtop,currleft)-newlat(currbottom,currleft)];
            s.XData([currleft currright]);
            s.YData([currtop currbottom]);
            
        case 'w' %the user wants to move north
            
            if currtop+move>=2
                tempmove=move;
            elseif currtop==2
                tempmove=0;
            else
                tempmove=currtop-2;
            end
            currtop=currtop-tempmove;
            currbottom=currbottom-tempmove;
            r.Position=[newlong(currtop,currleft),newlat(currbottom,currleft),newlong(currtop,currright)-newlong(currtop,currleft),newlat(currtop,currleft)-newlat(currbottom,currleft)];
            s.XData([currleft currright]);
            s.YData([currtop currbottom]);
            
        case 'a' %the user wants to move west
            
            if currleft-move>=2
                tempmove=move;
            elseif currleft==2
                tempmove=0;
            else
                tempmove=size(long,1)-currleft;
            end
            currleft=currleft-tempmove;
            currright=currright-tempmove;
            r.Position=[newlong(currtop,currleft),newlat(currbottom,currleft),newlong(currtop,currright)-newlong(currtop,currleft),newlat(currtop,currleft)-newlat(currbottom,currleft)];
            s.XData([currleft currright]);
            s.YData([currtop currbottom]);

            
        case 'd' %the user wants to move east
            
            if currright+move<=size(long,2)
                tempmove=move;
            elseif currleft==size(long,2)
                tempmove=0;
            else
                tempmove=size(long,2)-currright;
            end
            currleft=currleft+tempmove;
            currright=currright+tempmove;
            r.Position=[newlong(currtop,currleft),newlat(currbottom,currleft),newlong(currtop,currright)-newlong(currtop,currleft),newlat(currtop,currleft)-newlat(currbottom,currleft)];
            s.XData([currleft currright]);
            s.YData([currtop currbottom]);

        case 'q'
            %user quits
            break;
    end
    set(gcf,'CurrentCharacter','n');

    s.XData([currleft currright]);
    s.YData([currtop currbottom]);

    pause(0.1);
    end
end

function callback(hObject, callbackdata)

end

