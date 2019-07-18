function [approx] = nsqrt(number,guess,iters)
%Nsqrt Use Newstons method and non-linear systems of equations to solve for
%square root of user given value
%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 23
lewitt@usc.edu
%}
%%Error Checking
if ~(nargin==3 || nargin==2)
    error("Only 2 or 3 inputs allowed")
end
if nargin==2
    iters=10;
end
inputs=[number,guess,iters];
for i=1:3
    if ~isscalar(inputs(1))
        error("Input must be scalar")
    end
    if ~isnumeric(inputs(i))
    error("Input must be numeric")
    end
    if ~(inputs(i)>0)
        error("Input must be positive")
    end
end
%Runs through iters number of iterations
for i=1:iters
    %The jacobian is 2 times the x0 value
    jac=2*guess;
    %The function value is the square of the guess subtracted from the
    %actual number
    func=guess*guess - number;
    %The delta is the amount to change x0 to get closer to the correct
    %number
    delta=-1*func/jac;
    %Update the x0
    guess=guess+delta;
    
end
%Output the final guess
approx=guess;
end


