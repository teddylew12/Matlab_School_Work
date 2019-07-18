%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 11
lewitt@usc.edu
%}
%Reading the XLSX file
filename='carinfo.xlsx';
sheetname='Sheet1';
subrange='A2:G7';
[num,text,raw]=xlsread(filename,sheetname,subrange);
data=struct('Make',[],'Model',[],'HP',[],'Torque',[],'Weight',[],'WheelBase',[],'FuelEff',[],'score',[]);
data=repmat(data,1,6);
%Creating the Structure Array
for i=1:6
    data(i).Make=cell2mat(text(i,1));
    data(i).Model=cell2mat(text(i,2));
    data(i).HP=num(i,1);
    data(i).Torque=num(i,2);
    data(i).Weight=num(i,3);
    data(i).Wheelbase=num(i,4);
    data(i).FuelEff=num(i,5);
    data(i).score=(data(i).HP *0.95)+(data(i).Torque *0.87)-(data(i).Weight *0.13)+(data(i).Wheelbase *0.10)+(data(i).FuelEff *0.50);
end  
t=0;
perm='wt';
fileID=fopen('results.txt',perm);
%Finds the max score and prints it, then deletes that field, so the next
%time it looks for max score it is looking at only the remaining entries
while ~isempty(data)
   max=0;
   index=0;
   for i=1:6-t
       if data(i).score >max
           max=data(i).score;
           index=i;
       end   
   end
fprintf(fileID,'Make: %s \nModel: %s \nOverall Score: %.2f \nHorsepower: %d\nTorque: %d ft-lbs\nWeight: %d lbs\nWheelbase: %.1f in.\nFuel Efficency: %.1f mpg\n\n',data(index).Make,data(index).Model,data(index).score,data(index).HP,data(index).Torque,data(index).Weight,data(index).Wheelbase,data(index).FuelEff);
data(index)=[];
t=t+1;
end
fclose(fileID);

