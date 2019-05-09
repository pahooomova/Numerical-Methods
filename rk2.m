function y = rk2(y,h,c2,D)
%RK2 Summary of this function goes here
%   Detailed explanation goes here
a21 = c2;
b1 = 0.5*c2;
b2 = 1-b1;

k1 = h*D*y;
k2 = h*D*(y+a21*k1);
y = y+b1*k1+b2*k2;
end
