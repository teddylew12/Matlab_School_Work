%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 10
lewitt@usc.edu
%}
clear;clc;
ci=struct('radius',[],'center',[],'area',[]);
tr=struct('sidelengths',[],'center',[],'area',[]);
sq=struct('sidelength',[],'center',[],'area',[]);
shapes=struct('circle',ci,'triangle',tr,'square',sq);
correct=false;

while ~correct
    cir=input("Would you like to create a circle? (Y/N)",'s');
    if cir=="y" ||cir=="Y"
       shapes.circle.radius=randi([1,20],1);
       shapes.circle.center=randi([1,10],1,2);
       shapes.circle.area= pi * (shapes.circle.radius)^2;
    end
    tri=input("Would you like to create a triangle? (Y/N)",'s');
    if tri=="y" ||tri=="Y"
       shapes.triangle.sidelengths=randi([1,20],1,2);
       shapes.triangle.center=randi([1,10],1,2);
       shapes.triangle.area= shapes.triangle.sidelengths(1)*shapes.triangle.sidelengths(2)/2;
    end
    rect=input("Would you like to create a square? (Y/N)",'s');
    if rect=="y" ||rect=="Y"
       shapes.square.sidelength=randi([1,20],1);
       shapes.square.center=randi([1,10],1,2);
       shapes.square.area= shapes.square.sidelength(1)^2;
    end
    %Checking for creation of more than 1 shapes 
    temp={"square","triangle","circle"};
    sum=0;
    for i=1:3
        if ~isempty((shapes.(temp{i}(1)).center))
            sum=sum+1;
        end
    end
    %Deciding what to do with the squares
    if sum==0
        fprintf("No structures created! Try again\n");
    
    elseif sum==1
        fprintf("You only created one structure silly. Try again\n");
    else
        correct=true;
    end
end
distoutput=false;
while ~distoutput
   fprintf("Choose two shapes to calculate the distance between centers.\nYou must spell them EXACTLY as they were written\n");

   shape1=input("First Shape:",'s');
   
   shape2=input("Second Shape:",'s');
   if (shape1=="circle" ||shape1=="triangle" ||shape1=="square")&& (shape2=="circle" ||shape2=="triangle" ||shape2=="square")
       if ~isempty(shapes.(shape1).center) && ~isempty(shapes.(shape1).center)
           xdist=(shapes.(shape1).center(1)-shapes.(shape2).center(1))^2;
           ydist=(shapes.(shape1).center(2)-shapes.(shape2).center(2))^2;
           totDist=sqrt(xdist + ydist);
           fprintf("The distance between the %s and the %s is %.3f\n",shape1,shape2,totDist);
           distoutput=true;
       else
           fprintf("You entered a shape that wasn't created! Try Again \n")
       end
   else
       fprintf("Try Again! You must spell them EXACTLY as they were written\n")
   end
end
areaoutput=false;
while ~areaoutput
   fprintf("Choose two shapes to calculate the ratio of areas.\nYou must spell them EXACTLY as they were written\n");

   shape1=input("First Shape:",'s');
   
   shape2=input("Second Shape:",'s');
   if (shape1=="circle" ||shape1=="triangle" ||shape1=="square")&& (shape2=="circle" ||shape2=="triangle" ||shape2=="square")
       if ~isempty(shapes.(shape1).center) && ~isempty(shapes.(shape1).center)
           areaone=shapes.(shape1).area(1);
           areatwo=shapes.(shape2).area(1);
           ratio=areaone/areatwo;
           fprintf("The ratio of areas between the %s and the %s is %.3f\n",shape1,shape2,ratio);
           areaoutput=true;
       else
           fprintf("You entered a shape that wasn't created! Try Again \n")
       end
   else
       fprintf("Try Again! You must spell them EXACTLY as they were written\n")
   end
end
