%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 09
lewitt@usc.edu
%}
clear;clc;
%%User Inputs
pOneA=char(input("Enter parent 1 A genes: \n",'s'));
pOneB=char(input("Enter parent 1 B genes: \n",'s'));
pTwoA=char(input("Enter parent 2 A genes: \n",'s'));
pTwoB=char(input("Enter parent 2 B genes: \n",'s'));
%%Creating Parent Cell Arrays
pOneArray={strcat(pOneA(1),pOneB(1)),strcat(pOneA(1),pOneB(2)),strcat(pOneA(2),pOneB(1)),strcat(pOneA(2),pOneB(2))};
pTwoArray={strcat(pTwoA(1),pTwoB(1)),strcat(pTwoA(1),pTwoB(2)),strcat(pTwoA(2),pTwoB(1)),strcat(pTwoA(2),pTwoB(2))};
%%Creating the final Pundit Square
finalArray={5};
finalArray(2:5,1)=pOneArray';
finalArray(1,2:5)=pTwoArray;


for i=2:5
    for j= 2:5
        a=sort(strcat(pOneArray{j-1}(1),pTwoArray{i-1}(1)));
        b=sort(strcat(pOneArray{j-1}(2),pTwoArray{i-1}(2)));
        c=strcat(a,b);
        finalArray{i,j}=c;
    end
end
disp(finalArray)
%}