function [lower,upper] = ludecomp(decMat)
%LUDECOMP Decomposes a Matrix into an upper and a lower matrix such that
%LU=A
%   Uses elemetary row operations
%{
Theodore Lewitt
ITP 168 Spring 2019
HW 11
lewitt@usc.edu
%}
if nargin~=1
    error("ludecomp requires 1 argument \n")
end
if ~(isnumeric(decMat))
    error("ludecomp requires an numeric matrix \n")
end
if size(decMat,1)>size(decMat,2)
    error("ludecomp requires less rows than columns \n")
end
upper=decMat;
lower=eye(size(decMat,1));

numrows=size(upper,1);
diag=1;
while diag<=size(upper,1)
        tempmat=eye(size(lower));
        for iter=1:numrows-diag
            %Dividing factor and change values of upper
            divFac=-upper(diag+iter,diag)/upper(diag,diag);
            upper(diag+iter,:)=divFac.*upper(diag,:)+upper(diag+iter,:);
            %Change values of lower         
            tempmat(diag+iter,:)=divFac.*tempmat(diag,:)+tempmat(diag+iter,:);   
        end
        lower=lower/(tempmat);
        diag=diag+1;
end
disp(upper)
disp(lower)
end


