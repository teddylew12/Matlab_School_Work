function [outputvector] = usolve(inputMat,inputVec)
%Usolve Function solves a system of linear equations if there is exactly
%one solution
%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 22
lewitt@usc.edu
%}

%%Input Validation
if ~(nargin==2)
    error("Only 2 inputs allowed")
end
if ~(isnumeric(inputMat)&&isnumeric(inputVec))
    error("Inputs must be numeric")
end
if ~ismatrix(inputMat)
    error("Input Matrix is not an matrix")
end
if ~iscolumn(inputVec)
    error("Second Input must be a column vector")
end
if ~(size(inputMat,1)==size(inputVec,1))
    error("Number of rows in each input must be the same")
end
%%Solution Exist
%Create an augmented matrix containing both the input matrix and the input
%vector


augmat=[inputMat inputVec];
[row,col]=size(inputMat);


%Check that the rank of the inut matrix and the augmented matrix are the
%same, otherwise no solution will exist


if rank(inputMat)~=rank(augmat)
    warning("No solution exists")
    outputvector=[];
end

%One Solution Exists if the ranks are the same and the rank of the input
%matrix is the same as the number of columns in the input matrix


if (rank(inputMat)==rank(augmat) && rank(inputMat)==col)
    redaug=rref(augmat);
    newIMat=redaug(:,1:col);
    outputvector=redaug(:,col+1);
    
    
%No Solution Exists if the ranks are the same and the rank of the input
%matrix is greater than as the number of columns in the input matrix

elseif (rank(inputMat)==rank(augmat)&&rank(inputMat)>col)
    warning("No solution exists")
    outputvector=[];
    
%Infinite Solutions Exist if the ranks are the same and the rank of the input
%matrix is less than the number of columns in the input matrix


elseif (rank(inputMat)==rank(augmat)&&rank(inputMat)<col)
    warning("Infinite solutions exist")
    outputvector=[];
    
end

end

