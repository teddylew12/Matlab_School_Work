%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 03
lewitt@usc.edu
%}
clear;clc;

%%Setup Random Vectors

expOne=randi([0,1],1,10);

expTwo=randi([0,1],1,100);

expThree=randi([0,1],1,1000);

%%Calculate Probabilities
numHeadsOne=sum(expOne);
numTailsOne=10-numHeadsOne;
probHeadsOne=10* numHeadsOne;
probTailsOne=10* numTailsOne;

numHeadsTwo=sum(expTwo);
numTailsTwo=100-numHeadsTwo;
probHeadsTwo= numHeadsTwo;
probTailsTwo= numTailsTwo;

numHeadsThree=sum(expThree);
numTailsThree=1000-numHeadsThree;
probHeadsThree= numHeadsThree /10;
probTailsThree= numTailsThree/10;
%%User Defined Flips
numFlips=input("Enter number of coin flips: \n");
expUser=randi([0,1],1,numFlips);
numHeadsUser=sum(expUser);
numTailsUser=numFlips-numHeadsUser;
probHeadsUser= 100* numHeadsUser /numFlips;
probTailsUser= 100*numTailsUser/numFlips;

%% Output
fprintf('Trial 1: 10 Flips: %.f heads (%.f %%) : %.f tails (%.f %%) \n',numHeadsOne,probHeadsOne,numTailsOne,probTailsOne);
fprintf('Trial 2: 100 Flips: %.f heads (%.f %%) : %.f tails (%.f %%) \n',numHeadsTwo,probHeadsTwo,numTailsTwo,probTailsTwo);
fprintf('Trial 3: 1000 Flips: %.f heads (%.f %%) : %.f tails (%.f %%) \n',numHeadsThree ,probHeadsThree,numTailsThree,probTailsThree);
fprintf('Trial 4: %.f Flips: %.f heads (%.f %%) : %.f tails (%.f %%) \n',numFlips,numHeadsUser,probHeadsUser,numTailsUser,probTailsUser);