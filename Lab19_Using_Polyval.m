%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 19
lewitt@usc.edu
%}
clear;clc;
%%Data Input
filename="brainhead.txt";
data=dlmread(filename);
fprintf("%d,%d",size(data,1),size(data,2))
disp(data)
maletwobrain=[];
maletwohead=[];
malefourbrain=[];
malefourhead=[];
femaletwobrain=[];
femaletwohead=[];
femalefourbrain=[];
femalefourhead=[];
%%Data to Vectors
%Checks the first two columns to check the gender and age and allocate
%accordingly
for iter=1:size(data,1)
    if data(iter,1)==1
        if data(iter,2)==1
            maletwobrain=[maletwobrain data(iter,4)];
            maletwohead=[maletwohead data(iter,3)];
        else
            malefourbrain=[malefourbrain data(iter,4)];
            malefourhead=[malefourhead data(iter,3)];
        end
    else
        if data(iter,2)==1
            femaletwobrain=[femaletwobrain data(iter,4)];
            femaletwohead=[femaletwohead data(iter,3)];
        else
            femalefourbrain=[femalefourbrain data(iter,4)];
            femalefourhead=[femalefourhead data(iter,3)];
        end
    end
end
%%Polynomial Coefficents
%Use polyfit with degree=1 to calculate the linear regression of the data
[mtwo]=polyfit(maletwobrain,maletwohead,1);
[mfour]=polyfit(malefourbrain,malefourhead,1);
[ftwo]=polyfit(femaletwobrain,femaletwohead,1);
[ffour]=polyfit(femalefourbrain,femalefourhead,1);
%%Plotting
figure()
%Size of the circles
sz=20;
%Need 4 plots in a 2x2 format 
subplot(2,2,1)
%Plot the scatter data with filled circles of size sz
scatter(maletwobrain,maletwohead,sz,'filled')
%Hold on to allow the line plot to overlay
hold on
%Use max and min to find range of x values to use for the line
xrnge=linspace(min(maletwobrain),max(maletwobrain),100);
%Evaulate those points in xrange given the polynomial coefficents
temppoly=polyval(mtwo,xrnge);
%Plot the xrange and the yvalues
plot(xrnge,temppoly)
hold off
%Add title, x and y labels
title("Male 20-46")
xlabel("Brain Mass (gram)")
ylabel("Head Size (cm^3)")

%Same comments as last subplot
subplot(2,2,2)
scatter(malefourbrain,malefourhead,sz,'filled')
hold on
xrnge=linspace(min(malefourbrain),max(malefourbrain),100);
temppoly=polyval(mfour,xrnge);
plot(xrnge,temppoly)
hold off
title("Male 46+")
xlabel("Brain Mass (gram)")
ylabel("Head Size (cm^3)")


subplot(2,2,3)
scatter(femaletwobrain,femaletwohead,sz,'filled')
hold on
xrnge=linspace(min(femaletwobrain),max(femaletwobrain),100);
temppoly=polyval(ftwo,xrnge);
plot(xrnge,temppoly)
hold off
title("Female 20-46")
xlabel("Brain Mass (gram)")
ylabel("Head Size (cm^3)")



subplot(2,2,4)
scatter(femalefourbrain,femalefourhead,sz,'filled')
hold on
xrnge=linspace(min(femalefourbrain),max(femalefourbrain),100);
temppoly=polyval(ffour,xrnge);
plot(xrnge,temppoly)
hold off
title("Female 46+")
xlabel("Brain Mass (gram)")
ylabel("Head Size (cm^3)")