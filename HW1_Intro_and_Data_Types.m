%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 02
lewitt@usc.edu
%}
clear;clc;

%%Ask For Values
title= "Flight Calculator";
disp(title)
gliderWeight= input("Enter Glider Weight in lbs: \n");
gliderHeight= input("Enter Glider Height in ft: \n");
gliderDistance=input("Enter distance glider travels before reaching ground: \n");

%%Calculating Glide Angle
gliderAngle=atand(gliderHeight/gliderDistance);
%%Calculating Lift and Drag
%D=L*tan(a) so  L *(cos(a) +tan(a)*sin(a))=W
%L=W/(cos(a)+ tan(a)*sin(a)) 
gliderLift=gliderWeight/(cosd(gliderAngle)+tand(gliderAngle)*sind(gliderAngle));
gliderDrag=gliderLift*tand(gliderAngle);
%%Printing Results
fprintf('Glide angle: %.2f degrees \n Lift: %.2f lbs\n Drag: %.2f lbs',gliderAngle,gliderLift,gliderDrag)
