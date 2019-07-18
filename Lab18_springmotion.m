function [] = springmotion(radius,numrev,lengthspr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
inputs=[radius,numrev,lengthspr];
for i=1:3
    if ~isnumeric(inputs(i))
        error("Non-numeric input!")
    end
    if ~isscalar(inputs(i))
        error("Non-scalar input!")
    end
    if inputs(i)<=0
        error("Negative input!")
    end
end
if floor(numrev)~=numrev
    error("Number of Revolutions must be an integer")
end
numpoints=100*numrev;
angles=linspace(0,2*pi*numrev,numpoints);
xvec=radius.*cos(angles);
yvec=radius.*sin(angles);
zvec=linspace(0,lengthspr,numpoints);
figure()
prim=plot3(xvec,yvec,zvec);
zlim([0 2*lengthspr])

animvec1=linspace(0,lengthspr);
animvec2=linspace(0,lengthspr*.5);

for iter=1:length(animvec1)
    newZ=linspace(0,lengthspr+animvec1(iter),numpoints);
    prim.ZData=newZ;
    pause(0.1)
end

for iter=1:length(animvec1)
    newZ=linspace(0,2*lengthspr-animvec1(iter),numpoints);
    prim.ZData=newZ;

    pause(0.1)
end
for iter=1:length(animvec2)
    newZ=linspace(0,lengthspr-animvec2(iter),numpoints);
    prim.ZData=newZ;
    pause(0.1)
end
for iter=1:length(animvec2)
    newZ=linspace(0,lengthspr/2+animvec2(iter),numpoints);
    prim.ZData=newZ;
    pause(0.1)
end

end


