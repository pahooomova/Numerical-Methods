function h_new= newh(xk,h,x)
%ADDH Summary of this function goes here
%   Detailed explanation goes here
if xk+h>x
    h_new=x-xk;
else
    h_new=h;
end

end
