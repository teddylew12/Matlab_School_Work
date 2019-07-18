%{
Theodore Lewitt
ITP 168 Spring 2019
HW 06
lewitt@usc.edu
%}
clear;clc;
%%Creation of cipher
cipher='DRIUSYAQBWTEZNLPMOCVHGFJXK';
regular='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
cipherarray={1,26};
regulararray={1,26};
for i=1:length(cipher)
    cipherarray{i}=cipher(i);
    regulararray{i}=regular(i);
end
%%User Input
validFile=false;
while ~validFile
    file=input("Please enter the name of the file to write to:",'s');
    if contains(file,".txt")
        fileID=fopen(file,'wt');
        fprintf(fileID,"Your ciphered message:\n");
        validFile=true;
    else
        fprintf("Please enter a valid filename\n")
    end
end
%%Writing to file
doneWriting=false;
while ~doneWriting
    cipheredChars='';
    tocipher=upper(input("Enter a line of text to encrypt or 'done' to quit:",'s'));
    %Use strcmpi to check if the input is Done, case insensitive
    if strcmpi(tocipher,"Done")
        doneWriting=true;
    else
        %Initialize the output array with the same size as the input array
        cipheredChars=char(tocipher);
        tocipher=char(tocipher);
        for i=1:length(tocipher)
            %for each character, use a logical array to find the index of the character in the
            %normal array, use that logical array to get the character in
            %the index of the ciphered array
            cipheredChars(i)=cipher(regular==tocipher(i));
        end
    end
    %Print to the file with an line break
    fprintf(fileID,"%s \n",cipheredChars);
    
end
%Close the file and send an ending message
fprintf("Finished encrypting...\n");
fprintf("Filename: %s ",file);
fclose(fileID); 