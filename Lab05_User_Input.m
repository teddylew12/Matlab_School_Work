%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 05
lewitt@usc.edu
%}
clear;clc;


%%Setting Up Problem
randInts=randi([-10,10],1,2);
disp(randInts)
%Add =0 Subtract =1
addSub=0;
%%Displaying the Problem
%The Addition Branch
if addSub == 0
    correct=sum(randInts);
    fprintf("Quick! Solve: %.f + %.f \n",randInts(1),randInts(2))
    tic()
    userAnswer=input("");
    timeElapsed=toc();
    %Check for correctness
    if userAnswer == correct
        fprintf ("Correct!! \n It took you %.2f seconds",timeElapsed)
    else
        fprintf ("Incorrect :( \nIt took you %.2f seconds",timeElapsed)
    end
%The subtraction branch
elseif addSub == 1
    correct = randInts(1)-randInts(2);
    fprintf("Quick! Solve: %.f - %.f \n",randInts(1),randInts(2))
    tic()
    userAnswer=input("");
    timeElapsed=toc();
    %Check for correctness
    if userAnswer == correct
        fprintf ("Correct!! \nIt took you %.2f seconds",timeElapsed)
    else
        fprintf ("Incorrect :( \n It took you %.2f seconds",timeElapsed)
    end
else
    fprintf("Invalid value for addSub: %.f",addSub)
end


