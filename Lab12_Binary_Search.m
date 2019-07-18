%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 12
lewitt@usc.edu
%}
%Create Sorted vector to be searched
vec=sort(randperm(50,30));
%User Input
correct=false;
while ~correct
    num=input("Enter a number between 1-50 to find:");
    if mod(num,1)==0 && num>=1 && num <=50
        %Ready for binary search
        correct=true;
    else   
        fprintf("Invalid input! Try Again!\n")
    end
end
%Binary Search
left=1;
right=length(vec);
mid=0;
finalIndex=1;
while ~(left==right)
    %Using floor(x) returns an x to the nearest integer less than or equal
    %to x
    %Zybooks Table 10.2.1:Rounding functions
    mid=floor((left+right)/2);
    %
    if vec(mid)>num
        right=mid-1;
    elseif vec(mid)<num
        left=mid+1;
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