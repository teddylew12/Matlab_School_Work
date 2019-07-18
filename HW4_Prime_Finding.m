%{
Theodore Lewitt
ITP 168 Spring 2019
HW 4
lewitt@usc.edu
%}
clear;clc;

%%Input
running=false;
while ~running

    correct=false;
    outputArray=[];
    while ~ correct
        numPrimes=input("How many prime numbers do you want?: \n");
        if mod(numPrimes,1)==0
            if numPrimes>0
                %Preallocate an row array of 1x#primes 
                outputArray=ones(1,numPrimes) + 1;
                correct=true;
            else
                fprintf("Invalid input: Please select a positive integer\n");
            end
        else
            fprintf("Invalid input: Please select a positive integer\n");
        end
    end
    disp(outputArray)
    %%Finding A Prime
    for i=1:numPrimes
        isaprime=false;
        t=2;

        while ~isaprime
                numdivisible=0;
                t=t+1;
                for j=1:i-1
                    if mod(t,outputArray(j))==0
                        numdivisible=numdivisible+1;
                    end     
                end
                if numdivisible==0
                    outputArray(i)=t;
                    isaprime=true;
                end   

        end
    end
    %%Print Primes
    fprintf("Your primes are: \n")
    for f=1:numPrimes
        fprintf("%d: %d\n",f,outputArray(f));
    end
    userinput=input("Would you like to do it again (Y/N)?",'s');
    if userinput=="n" || userinput=="N"
        running=true;
        fprintf("See ya!")
    else
        fprintf("Let's do it again!")
    end    
end
%%Repeat