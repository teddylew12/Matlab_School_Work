function [] = tumor(n,m)
%tumor Plots a tumor like object in 3D
%   See lab details for how it works :)
%{
Theodore Lewitt
ITP 168 Spring 2019
Lab 17
lewitt@usc.edu
%}
if ~(isscalar(n) && isscalar(m))
    error("Input isn't scalar")
end
if ~(isnumeric(n) && isnumeric(m))
    error("Input isn't numeric")
end
if ~(mod(n,1)==0 && mod(m,1)==0)
    error("Input isn't integer")
end
if ~(n>0 && m>0)
    error("Input isn't posiitve")
end
theta=0:.05:2*pi;
phi=0:.05:pi;
[thetaGrid,phiGrid]=meshgrid(theta,phi);
rho=1+.2*(sin(m*thetaGrid).*sin(n*phiGrid));
x=rho.*sin(phiGrid).*cos(thetaGrid);
y=rho.*sin(phiGrid).*sin(thetaGrid);
z=rho.*cos(phiGrid);
surf(x,y,z)
end

