%{
Theodore Lewitt
ITP 168 Spring 2019
HW 02
lewitt@usc.edu
%}
clear;clc;
%%File Loading
correct=false;
while ~correct
    fname=input("Please enter your filename, be sure to include the .txt!\n",'s');
    if isfile(fname)
        correct=true;
    else
        fprintf("Try again with a correctly named file! \n")
    end
end
%Reads file data with space delimiter
data=dlmread(fname,' ');
head=(data(1,:));

%Reshape data to rectangular grid given by the first line of the file
long=reshape(data(2:end,1),[head(1) head(2)]);
lat=reshape(data(2:end,2),[head(1) head(2)]);
elev=reshape(data(2:end,3),[head(1) head(2)]);


exploremap(long,lat,elev)



