function [] = explode(velo,angle,time,impulse,massOne,massTwo)
%explode Creates a plot of a two mass system trajectory with explosion and
%time=time 
%   See Homework for more details ;)
%%Input Validation
if nargin==5
    massTwo=massOne;
end
inputs=[velo,angle,time,impulse,massOne,massTwo];
for i=1:6
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
if angle>=90
    error("Enter an angle between 0 and 90 degrees!")
end
g=9.81;
tground=2*velo*sind(angle)/g;
if time>=tground
    error("Time of explosion must be before ball hits ground")
end

%%Trajectory Before Explosion
pretimeVec=0:.1:time;
posttimeVec=0:.1:tground-time;

xVec=velo.*cosd(angle)* pretimeVec;
yVec=velo.*sind(angle)*pretimeVec -.5*g.*pretimeVec.*pretimeVec;
finalspot=[xVec(end),yVec(end)];
%%Trajectory of Centroid
newxVelo=velo*cosd(angle);
newyVelo=velo*sind(angle)-g*time;
centxVec=finalspot(1)+newxVelo.*posttimeVec;
centyVec=finalspot(2)+newyVelo*posttimeVec -.5*g.*posttimeVec.*posttimeVec;

%%Trajector of Masses
massonexVec=finalspot(1)+(newxVelo+impulse/massOne).*posttimeVec;
massoneyVec=finalspot(2)+newyVelo.*posttimeVec -.5*g.*posttimeVec.*posttimeVec;

masstwoxVec=finalspot(1)+(newxVelo-impulse/massTwo).*posttimeVec;
masstwoyVec=finalspot(2)+newyVelo.*posttimeVec -.5*g.*posttimeVec.*posttimeVec;
%%Plot
figure()
hold on
xlabel("Distance(meters)")
ylabel("Height(meters)")
title("Exploding Two-Mass Trajectory")
plot(xVec,yVec)
plot(centxVec,centyVec)
plot(massonexVec,massoneyVec)
plot(masstwoxVec,masstwoyVec)
legend('Before Explosion','Centroid','Mass 1','Mass 2')
end

