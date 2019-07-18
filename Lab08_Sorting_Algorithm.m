%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 07
lewitt@usc.edu
%}
clear;clc;

%%The Algorithm

%% Setting up the Vector
rando=randi([1,100],1,125);
%% Implement the Algorithm
noswapsmade=false;
while ~(noswapsmade)
    numswaps=0;
    for i=1:size(rando,2)-1;
       if rando(i)> rando(i+1);
           temp=rando(i+1);
           rando(i+1)=rando(i);
           rando(i)=temp;
           numswaps=numswaps +1;
       end
    end
    if (numswaps==0);
        noswapsmade=true;
    end
end
%% Output

disp(rando)