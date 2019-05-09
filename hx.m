function h = hx( D,y0,x0,x,type,eps )
%H Summary of this function goes here
%   Detailed explanation goes here
s=type+1;
delta=(1/max(abs(x0),abs(x)))^s+norm(D*y0,2)^s;
h=(eps/delta)^(1/s);
end