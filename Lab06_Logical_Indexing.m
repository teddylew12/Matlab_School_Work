%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 06
lewitt@usc.edu
%}
clear;clc;



%%Load the Data
load("mayorData.mat");
projSalary=allData(:,4);
disp(projSalary)
totEarnings=allData(:,5);
overages=allData(:,2);
ovPecBasePay=allData(:,3);
%%Get Rid of Highest and Lowest Earners
meaningful=projSalary <=100,000 && projSalary >= 15,000;
disp(meaningful)


%%Display Statistics
disp(totEarnings(meaningful))
avgEarnings=mean(totEarnings(meaningful));
medEarnings=median(totEarnings(meaningful));
overagesLogical= overages(meaningful)>0;
pplWithOverages=sum(overagesLogical);
avgPec=median(ovPecBasePay(overagesLogical));
fprintf("Average Total Earnings: $%.2f \nMedian Total Earnings: $%.2f \nThere are %.f employees with overages\nAverage overage: %.2f %%",avgEarnings,medEarnings,pplWithOverages, avgPec)
