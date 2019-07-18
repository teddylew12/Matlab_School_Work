function [outcellArr] = wordhist(fname)
%wordhist Outputs cell array with histogram of words
%  Uses regular expressions to check for words
%{
Theodore Lewitt
ITP 168 Spring 2019
LAb 24
lewitt@usc.edu
%}
%%Error Checking
if ~isfile(fname)
    error("File not found")
end
%Open the file and get the first line
fID=fopen(fname);
currline=fgetl(fID);

words=[];
looking=True;
while looking
    %fgetl outputs -1 at the end of the document
    if isnumeric(currline)
        looking=False;
    else
        %Add words that include ' and - using this regular expression
        words=[words regexp(currline,'\w+[\w\''-]\w*','match')];
        currline=fgetl(fID);
    end
end
%Close the File
fclose(fID)

%Create the Histogram
count=1;
while count<=length(words)
    %Take the next word in the word array
    word=words{count};
    occurArr=[];
    for iter=1:length(words)
        %check for matches in the rest of the word array and mark its index
        if strcmp(words{iter},word) && ~isempty(words{iter})
            occurArr=[occurArr iter];
        end
    end
    if ~isempty(occurArr)
        %Add to the output array the word and the number of occurances
        outcellArr{count,1}=word;
        outcellArr{count,2}=length(occurArr);
        %Delete occurances of the word within the word array to not doulbe
        %count
        for i=1:length(occurArr)
            num=occurArr(i);
            words(:,num)=[];
        end
    end
    %Move onto the next word
    count=count+1;
end
end


