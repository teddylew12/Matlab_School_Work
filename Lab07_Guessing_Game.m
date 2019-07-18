%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 07
lewitt@usc.edu
%}
clear;clc;
%%Choose a random integer
correct=randi([1 20],1);
disp(correct)
%%Ask for guesses
numguesses=1;
guess=input("Guess the number (between 1-20): \n");
while ~(guess==correct)
    
    if guess>correct
        fprintf("Too high, try a lower number!\n");
    else
        fprintf("Too low, try a higher number!\n");
    end
    guess=input("Guess the number (between 1-20): \n");
    numguesses=numguesses+1;
end
%%Output
fprintf("Correct! That took you %d guesses",numguesses);