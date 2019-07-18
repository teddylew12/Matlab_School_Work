function [mean,stdev,median,quartiles] = cstats(iarr)
%Cstats calculates mean, standard deviation, mean and quartiles for an
%numeric input array
%   1 output-Calculate the mean and standard deviation of the vector and return it as a two element vector output
%   2 outputs-Calculate the mean and standard deviation of the vector and return it as two separate output variables
%   3 outputs-Calculate the mean, standard deviation, and median and return it as three separate output variables
%   4 outputs-Calculate the mean, standard deviation, median, and quartiles and return them asseparate output variables
if ~isnumeric(iarr)
    error('Not an numeric array')
end
if ~(size(iarr,1)==1)
    error('Not an vector')
end
n=nargout;
if n>4 || n<1
    error('Incorrect number of output arguments')
end
switch n
    case 1
        mean=[mymean(iarr),mystd(iarr)];
        return
    case 2
        mean=mymean(iarr);
        stdev=mystd(iarr);
        return
    case 3
        mean=mymean(iarr);
        stdev=mystd(iarr);
        median=mymedian(iarr);
        return
    case 4
        
        mean=mymean(iarr);
        stdev=mystd(iarr);
        median=mymedian(iarr);
        quartiles=myquarts(iarr);
        return
end



function [mean] =mymean(iarr)
    sume=sum(iarr);
    mean=sume/length(iarr);
end
function [stdev] =mystd(iarr)
    numEl=numel(iarr);
    avg=mymean(iarr);
    numer=sum((iarr-avg).^2);
    stdev=sqrt(numer/numEl);
    
end
function [median] =mymedian(iarr)
    iarr=sort(iarr);
    numEl=length(iarr);
    if mod(numEl,2)==0
        median=.5*(iarr(numEl/2)+iarr(numEl/2+1));
    else
        median=iarr((numEl+1)/2);
    end

end
function [quarts] =myquarts(iarr)
    iarr=sort(iarr)
    numEl=length(iarr);
    if mod(numEl,2)==0
        firsthalf=iarr(1:numEl/2);
        secondhalf=iarr(numEl/2+1:end);
    else
        firsthalf=iarr(1:(numEl+1)/2);
        secondhalf=iarr((numEl+1)/2:end);
    end
    firstquart=mymedian(firsthalf);
    secquart=mymedian(iarr);
    thirdquart=mymedian(secondhalf);
    quarts=[firstquart,secquart,thirdquart];
end
end
