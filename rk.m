function [ y1, ro1, y2 ,ro2] = rk(y0,h,i,D,c2,type)
%RK Summary of this function goes here
%   Detailed explanation goes here
    if type==2
        r=@(y,h,c2,D) rk2(y,h,c2,D);%моя схема в12
    else
        r=@(y,h,c2,D) rk4(y,h,c2,D);%схема оппонент (39)
    end    
    y1=y0;
    
    for j=1:1:i
        y1=r(y1,h,c2,D);
    end
    y2=y0;
    for j=1:1:i*2
       y2=r(y2,h/2,c2,D);
    end
    ro1=norm((y2-y1)/(1-2^(-type)),2);
    ro2=norm((y2-y1)/(2^(type)-1),2);
end
