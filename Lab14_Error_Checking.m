function [ldrat] = ldratio(height,distance)
%LDRATIO calculates lift to drag ratio
    %Takes in a height and a distance, both positive, scalar and numeric
    %values
 
%Theodore Lewitt
%ITP 168 Spring 2019
%Lab 10
%lewitt@usc.edu
if ~nargin==2
    error('Incorrect number of inputs. Try again! \n')
end
if ~(isnumeric(height)&& isnumeric(distance))
    error('Non numeric input, try again! \n')
end
if ~(isscalar(height)&&isscalar(distance))
    error('Non scalar input, try again! \n')
end
if height<=0 || distance <=0
    error('Negative input, try again! \n')
end
ldrat=distance/height;
end

