%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 06
lewitt@usc.edu
%}
clear;clc;
months=["January","February","March","April","May","June","July","August","September","October","November","December"];
dates=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
dmy=ones(1,3);
%% Getting the Date
correctInfo=false;
while ~(correctInfo)
    day=input("Please enter the day:\n");
    month=input("Please enter the month:\n");
    year=input("Please enter the year:\n");
    if year>1752
        if month>0 && month<12
            switch month
                case {1,3,5,7,8,10,12}
                    if day>0 && day<32
                        correctInfo=true;
                        dmy=[day,month,year];
                     else
                    fprintf("Date Invalid, try again!  \n")
                    end
                case {2}
                    if mod(year,4)==0 
                        if mod(year,100)==0 
                            if mod(year,400)==0
                                if day>0 && day<30
                                    correctInfo=true;
                                    dmy=[day,month,year];
                                else
                                    fprintf("Date Invalid, try again!  \n")
                                end
                            else
                                if day>0 && day<29
                                      correctInfo=true;
                                      dmy=[day,month,year];
                                else
                                      fprintf("Date Invalid, try again! \n")
                                end 
                            end
                        else
                            if day>0 && day<30
                                correctInfo=true;
                                dmy=[day,month,year];
                            else
                                fprintf("Date Invalid, try again! \n")
                            end
                        end
                    else
                        if day>0 && day<29
                            correctInfo=true;
                            dmy=[day,month,year];
                        else
                            fprintf("Date Invalid, try again!   \n")
                        end
                    end
                otherwise

                     if day>0 && day<31
                       correctInfo=true;
                       dmy=[day,month,year];
                     else
                        fprintf("Date Invalid, try again! \n")
                     end
            end         
        end
    else 
       fprintf("Date Invalid, try again! \n")   
    end
end  
disp(dmy)
%%Zeller's Rule
calcYear=dmy(3);
if dmy(2) == 1 || dmy(2) ==2
    calcYear=dmy(3)-1;
    calcMonth=dmy(2)+10;
else
    calcMonth=dmy(2)-2;
end
d=mod(calcYear,1000);
disp(d)
c=(calcYear-d)/100;
disp(c)
%%Determine Day of Week
factor=dmy(1) + floor(((13*calcMonth) - 1)/5) + d + floor(d/4) +floor(c/4)-2*c;
%%Output
rem=mod(factor,7);
disp(rem)
fprintf('%s %d, %d is a %s ',months(dmy(2)),dmy(1),dmy(3),dates(rem+1))
    
      