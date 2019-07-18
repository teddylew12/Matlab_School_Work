%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 10
lewitt@usc.edu
%}
clear;clc;
%%
partTimeTed={"Ted Lewitt",92345,31,40,[]};
partTimeKat={"Katrina Poulin",88235,30,30,[]};
fullTimeNat={"Nat Redfern",44387,19000,20000,[]};
fullTimeEric={"Eric Duguay",90879,22000,15000,[]};
partTimeTed{5}(1)=partTimeTed{3}(1)*partTimeTed{4}(1);
partTimeKat{5}(1)=partTimeKat{3}(1)*partTimeKat{4}(1);
fullTimeNat{5}(1)=fullTimeNat{3}(1)+fullTimeNat{4}(1);
fullTimeEric{5}(1)=fullTimeEric{3}(1)+fullTimeEric{4}(1);
allofem={partTimeTed,partTimeKat,fullTimeNat,fullTimeEric};

fullTime=struct('Name',[],'ID',[],'hWage',[],'hWeek',[],'mPay',[]);
partTime=struct('Name',[],'ID',[],'mSalary',[],'mCommision',[],'mPay',[]);

fullTime=repmat(fullTime,1,2);
partTime=repmat(partTime,1,2);

%%
for i=1:2
    info=allofem(i);
    fullTime(i).name=info{1}(1);
    fullTime(i).ID=info{1}(2);
    fullTime(i).hWage=info{1}(3);
    fullTime(i).hWeek=info{1}(4);
    fullTime(i).mPay=info{1}(5);
    info=allofem(2+i);
    partTime(i).name=info{1}(1);
    partTime(i).ID=info{1}(2);
    partTime(i).mSalary=info{1}(3);
    partTime(i).mCommision=info{1}(4);
    partTime(i).mPay=info{1}(5);
end
employee=struct('fullTime',fullTime,'partTime',partTime);
running=false;
while ~running
    fprintf("Enter command exactly as listed: \nfullTime\npartTime\nQuit\n")
    choose=input("Choose:",'s');
    switch choose
        case "fullTime"
            correct=false;
            while ~correct
                for i=1:2
                    fprintf('%d: %s \n',i,employee.fullTime(i).name{1}(1))
                end
                    response=input("Choose:");
                    if response > 0 && response<3
                        %Note the use of dynamic field names in the
                        %following line
                        fprintf("%s \nMonthly Pay: $%d\n",employee.fullTime(response).name{1}(1),employee.fullTime(response).mPay{1}(1))
                        correct=true;
                    else
                        fprintf("Invalid input,try again\n")
                    end
                
            end
        case "partTime"
            correct=false;
            while ~correct
                for i=1:2
                    fprintf('%d: %s \n',i,employee.partTime(i).name{1}(1))
                end
                    response=input("Choose:");
                    if response > 0 && response<3
                        %Note the use of dynamic field names in the
                        %following line
                        fprintf("%s \nMonthly Pay: $%d\n",employee.partTime(response).name{1}(1),employee.partTime(response).mPay{1}(1))
                        correct=true;
                    else
                        fprintf("Invalid input,try again")
                    end
                
            end
        case "Quit"
            fprintf("See ya!\n")
            running=true;
        otherwise
            fprintf("Invalid input, try again!\n")
    end
end
