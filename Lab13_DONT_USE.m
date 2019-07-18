%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 10
lewitt@usc.edu
%}
clear;clc;
h=10;
d=5;
fprintf('%f',ldratio(d,h))
%{
%%Part 1
%{
I'm very confident in my algorithmic thinking. I took the intro to python
class and have had coding experience at summer internships. I was very
happy with the binary search algorithm assignment.
%}
%Initializing the variables, the leftmost index is 1 and the rightmost is
%the last in the array, or the length of the vector
vec=1:20;
left=1;
right=length(vec);
mid=0;
finalIndex=1;
while ~(left==right)
    %Using floor(x) returns an x to the nearest integer less than or equal
    %to x
    %Zybooks Table 10.2.1:Rounding functions
    
    mid=floor((left+right)/2);
    %Check if the number is bigger than the middle value
    %This REQUIRES a sorted array
    %This then restricts the search to the upper half of the array
    if vec(mid)>num
        right=mid-1;
    %Check if number is a smaller than the middle value
    %This then restricts the search ot the lower half of the array
    elseif vec(mid)<num
        left=mid+1;
    %If it isnt higher or lower, it has to be equal!!
    else
        
        finalIndex=mid;
        left=right;
    end
end
fprintf("Final Index: %d\n",finalIndex)
 %Checking that the value at the final index is a value in the vector
if ~(vec(finalIndex)==num)
    fprintf("The value %d does not exist in this vector",num)
else
    fprintf("Found the value %d at index %d \n",num,finalIndex)
end


%% Part 2
%{
I struggle with matrix operations and coding efficently

The lecture on debugging was very helpful for me but I still need to learn
about overall good coding practices
If there was a lecture on that it owuld be helpful
Most other things I need are outside the scope of the course, data
visualization and cleaning, pipeling data through an ETL pipeline

%}
%% Part 3
%{
My performance in this class so far has been satisfactory but not my best.
I went to class for the first 5 weeks but just filled out Zybooks. Since
then I have not gone to class and just complete the labs and homeworks on
my own time. I feel confident doing this and think I did well on the
midterm.

In the future I need to go to class and put in more work in understanding
matlab instead of relying on my python and java chops to scrape by.
%}
%}
