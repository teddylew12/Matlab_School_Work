%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 20
lewitt@usc.edu
%}
clear; clc;
%%Load in the Data
filename="traj.txt";
data=dlmread(filename);
%Each point is 10 seconds apart so the time goes from 0 to 10*#datapoints
%or 10*length(data)
tVals=linspace(0,10*length(data),length(data));
velo=zeros(1,length(data));
velo(1)=0;
%Divide by 10 to account for the 10 second difference
velo(2:end)=diff(data)./10;

acc=zeros(1,length(data));
acc(1)=0;
%Divide by 10 again to account for the 10 second difference
acc(2:end)=diff(velo)./(10*32.2);

figure()
subplot(3,1,1)
%Plot position Data
plot(tVals,data)
title('Atlantis Shuttle Launch Data')
xlabel('Time(s)')
ylabel('Altitude (ft)')
subplot(3,1,2)
%Plot velocity Data
plot(tVals,velo)
xlabel('Time(s)')
ylabel('Velocity (ft/s)')
subplot(3,1,3)
%Plot Accleration Data
plot(tVals,acc)
xlabel('Time(s)')
ylabel('Acceleration (g)')