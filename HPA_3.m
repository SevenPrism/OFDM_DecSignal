function [ya,yp] = HPA_3(xa,xp)
%DHPA Summary of this function goes here
%   Detailed explanation goes here

% 
% ya=xa;
% yp=xp;
ya=(6*xa)./(xa.^2+3);
yp=(pi/3)*((xa.^2)./(xa.^2+1))+xp;
