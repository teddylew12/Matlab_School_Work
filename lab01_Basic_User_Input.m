%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 01
lewitt@usc.edu
%}
clear;clc;

%%Weights
%Homework,lab,midterm,final,zybooks
weights=[0.25,0.15,0.25,0.30,0.05];

%%Inputs for grades

use_a_vector=input("To use a vector enter 0,\nTo enter individually press 1: \n"); 
if use_a_vector==1
    hwGrade=input("Enter your Homework Grade:");
    labGrade=input("Enter your Lab Grade:");
    midGrade=input("Enter your Midterm Grade:");
    finGrade=input("Enter your Final Grade:");
    zGrade=input("Enter your Zybooks Grade:");
    vectorize=[hwGrade,labGrade,midGrade,finGrade,zGrade];
else 
    vectorize=input("Enter your grades in the format \n[Homework,Lab,Midterm,Final,Zybooks]: \n");
end


%%Grade Calculation and printing
finalGrade=sum(weights .* vectorize);
final_string="Final Grade :%.2f ";
fprintf(final_string,finalGrade)

    
