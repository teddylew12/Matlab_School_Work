function [time,termVelo] = terminal(mass,height,coeff)
%Terminal Calculates terminal velocity
%   Detailed explanation goes here
%Validate the inputs
if ~(nargin==3)
    error("Need exatcly 3 inputs")
end
inputs=[mass,height,coeff];
for i=1:3
    if ~isscalar(inputs(i))
        error("Must be scalar")
    end
    if ~isnumeric(inputs(i))
        error("Must be numeric")
    end
    if ~(inputs(i)>0)
        error("Must be scalar")
    end
end
%Initial constants
g=9.81;
termVelo=mass*g/coeff;
fprintf("The terminal velocity is %.4f \n",termVelo)
numPoints=1;
pos=height;

while pos>0
    numPoints=numPoints+1;
    %Create the time vector
    time=linspace(0,numPoints*.01,numPoints);
    velo=termVelo*(1-exp((-1*coeff/mass).*time));
    %integrate the velocity with respect to time to find the position
    accum=cumtrapz(time,velo);
    pos=height-accum;
   % disp(pos(end))
end

fprintf("The time until the object hits the ground is %.4f",time(end))
figure()
subplot(3,1,1)
plot(time,pos)
title("Falling with Air Resistance")
xlabel("Time(s)")
ylabel("Height(m)")
subplot(3,1,2)
plot(time,velo)
xlabel("Time(s)")
ylabel("Velocity(m/s)")
subplot(3,1,3)
%Create accelearation vecotr by differentiating the velocity
accel=[9.81 diff(velo).*100];
plot(time,accel)
xlabel("Time(s)")
ylabel("Accleration(m/s^2)")









end


