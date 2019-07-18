%{
Theodore Lewitt
ITP 168 Spring 2019
HW 02
lewitt@usc.edu
%}
clear;clc;

%%Load Data
load('libraryData.mat');
vis=visitors;
cardH=cardHolders;
nCardH=newCardHolders;
pAtt=programAttendance;
fYear=1:12;
secYear=13:24;
thYear=25:36;
fYear=37:48;
%%Determine Net Change
netChange=cardH(end)-cardH(1);
fprintf("Net change in card holders: %.f \n",netChange)
%%Determine Avg Monthly Visitors
avgVisitorsTot=sum(vis)/size(vis,1);
fprintf("Average Monthly Visitors: %.f \n",avgVisitorsTot)
avgVisYears=[sum(vis(fYear)),sum(vis(secYear)),sum(vis(thYear)),sum(vis(fYear))]/12;

%%Determine Maximum Card Holders
% The first loop decides the year, the second loop goes through each month
% and checks if the value of that month is the max
%If it is, it gets added to the maxIndexes array which will be called by
%the print statements
max=0;
maxIndexes=ones(1,4);
for m=0:3
    for i=(m*12)+1:(m+1)*12
        if nCardH(i) > max
            max=nCardH(i);
            index=i;
            
        end
    end
    maxIndexes(m+1)=index;
    max=0;
end

%%Determine Maximum Program Attendance
% The first loop decides the year, the second loop goes through each month
% and checks if the value of that month is the max
%If it is, it gets added to the maxIndexes array which will be called by
%the print statements
max=0;
maxIndexesAttend=ones(1,4);
for m=1:4
    for i=((m-1)*12)+1:m*12
        if pAtt(i) >max
            max=pAtt(i);
            index=i;
            
        end
    end
    maxIndexesAttend(m)=index;
    max=0;
end
%%Print A Table
fprintf(" Year     Avg Visitors  Max New Cards   Max Attendance \n")
for i=1:4
    fprintf("Year %.f        %7.f      %6.f          %5.f\n",i,avgVisYears(i),nCardH(maxIndexes(i)),pAtt(maxIndexesAttend(i)))
end

%%Determine Expired/Renewed Cards

%I would use a for loop to check the ith and ith + 1 months and calculate
% the difference, subtracting the new cards number. This is shown as:
%Cards(month i + 1)=Cards(month i)+ newCards(month i) + Renewed - Expired
%So:
%Renewed- Expired =Cards(month i + 1)-Cards(month i)-newCards(month i)
%Any time the difference is less than zero the expired cards has exceeded 
%the renewed cars and we return that index to find the month and year
