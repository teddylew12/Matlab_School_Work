%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 21
lewitt@usc.edu
%}
clear;clc;
%Keep track of length of time
ending=1;
%Keep track on whether a sign changes has occured or not
signchange=false;
%Create initial Vector

time=linspace(0,ending,500);
while ~signchange
    
    %Velocity function given in pdf
    velo=-3.*time.*time +30.*time;
    
    %Area is integral of velocity with respec to time
    area=cumtrapz(time,velo);
    
    
    for index = 2:size(area,2)
        %Check if the area changes sign, but the first point is always zero
        %so ignore that by ignoring the index=2 case
        if ~(index==2) && ~(sign(area(index))==sign(area(index-1)))
            signchange=true;
        end
    end
    
    
    %If no area change is found, try adding another second
    if ~signchange
        ending=ending+1;
        time=linspace(0,ending,500);
    end

   
end
figure()

%Plots Velocity versus Time
plot(time,velo)
xlim([area(1) ending])

ylabel("Height/Velocity (m)/(m/s)")
xlabel("Time(s)")
title("Position and Velocity Profile")
hold on


%Plot Area Versus Time
plot(time,area)
xlim([area(1) ending])
legend("Velocity", "Height")


%Prints to Console
fprintf("The time until the object reaches the ground = %.2f seconds",ending)