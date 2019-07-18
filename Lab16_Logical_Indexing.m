%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 16
lewitt@usc.edu
%}
clear;clc;
%Gather Data
filename='Midterm.xlsx';
noon=xlsread(filename,'1230PM');
two=xlsread(filename,'2PM');
five=xlsread(filename,'5PM');
comb=xlsread(filename,'Combined');
firstbar=[sum(noon(:,1:3))/length(noon(:,1:3)); sum(two(:,1:3))/length(two(:,1:3)); sum(five(:,1:3))/length(five(:,1:3)) ];
twobar=[sum(noon(:,4))/length(noon(:,4)); sum(two(:,4))/length(two(:,4)); sum(five(:,4))/length(five(:,4)) ];
threebar=[sum(noon(:,5))/length(noon(:,5)); sum(two(:,5))/length(two(:,5)); sum(five(:,5))/length(five(:,5)) ];
fourbar=[sum(noon(:,6))/length(noon(:,6)); sum(two(:,6))/length(two(:,6)); sum(five(:,6))/length(five(:,6)) ];
fivebar=[sum(noon(:,7))/length(noon(:,7)); sum(two(:,7))/length(two(:,7)); sum(five(:,7))/length(five(:,7)) ];
sixbar=[sum(noon(:,8))/length(noon(:,8)); sum(two(:,8))/length(two(:,8)); sum(five(:,8))/length(five(:,8)) ];
totbar=[sum(noon(:,9))/length(noon(:,9)); sum(two(:,9))/length(two(:,9)); sum(five(:,9))/length(five(:,9)) ];


figure()
subplot(1,7,1)
bar(firstbar,'stacked')
title('Multiple choice')
legend('Page 1','Page 2','Page 3')
subplot(1,7,2)
bar(twobar)
title('Short Answer')
subplot(1,7,3)
bar(threebar)
title('Long Answer')
subplot(1,7,4)
bar(fourbar)
title('Coding 1')
subplot(1,7,5)
bar(fivebar)
title('Coding 2')
subplot(1,7,6)
bar(sixbar)
title('Coding 3')
subplot(1,7,7)
bar(totbar)
title('Total')
totnoon=noon(:,9);
tottwo=two(:,9);
totfive=five(:,9);
totcomb=comb(:,9);
noondata=[sum(totnoon<10);sum(totnoon>10 & totnoon<20);sum(totnoon>20 & totnoon<30);sum(totnoon>30 & totnoon<40);sum(totnoon>40 & totnoon<50);sum(totnoon>50 & totnoon<60);sum(totnoon>60 & totnoon<70);sum(totnoon>70 & totnoon<80);sum(totnoon>80 & totnoon<90);sum(totnoon>90)]./length(totnoon);
twodata=[sum(tottwo<10);sum(tottwo>10 & tottwo<20);sum(tottwo>20 & tottwo<30);sum(tottwo>30 & tottwo<40);sum(tottwo>40 & tottwo<50);sum(tottwo>50 & tottwo<60);sum(tottwo>60 & tottwo<70);sum(tottwo>70 & tottwo<80);sum(tottwo>80 & tottwo<90);sum(tottwo>90)]./length(tottwo);
fivedata=[sum(totfive<10);sum(totfive>10 & totfive<20);sum(totfive>20 & totfive<30);sum(totfive>30 & totfive<40);sum(totfive>40 & totfive<50);sum(totfive>50 & totfive<60);sum(totfive>60 & totfive<70);sum(totfive>70 & totfive<80);sum(totfive>80 & totfive<90);sum(totfive>90)]./length(totfive);
combdata=[sum(totcomb<10);sum(totcomb>10 & totcomb<20);sum(totcomb>20 & totcomb<30);sum(totcomb>30 & totcomb<40);sum(totcomb>40 & totcomb<50);sum(totcomb>50 & totcomb<60);sum(totcomb>60 & totcomb<70);sum(totcomb>70 & totcomb<80);sum(totcomb>80 & totcomb<90);sum(totcomb>90)]./length(totcomb);
data=[noondata twodata fivedata];
figure()
bar(combdata)
hold on
bar(data)
title('Distribution of Scores')
ylabel('Percentage of Total Scores')
legend('12:30 pm','2:00 pm','5:00 pm','Combined')


