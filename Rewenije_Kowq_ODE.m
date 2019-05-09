clear all;

delta=10;
r=28;
b=8/3;
h=0.01;
N=1000;

syms   x y z
f(x,y,z)= [ delta*(y-x);
            x*(r-z)-y;
            x*y-b*z; ];
        
       
 %начальные условия
 t=0;
 x=1;
 y=1;
 z=1;
 
%для сохранения координат

xtrace = x; 
ytrace = y; 
ztrace = z;
i = 1;  

while i <= N
k1 = h*f(x,y,z);
k2 = h*f(x + 0.5*k1(1), y+0.5*k1(2),z+0.5*k1(3));
k3 = h*f(x + 0.5*k2(1), y+0.5*k2(2),z+0.5*k2(3));
k4 = h*f(x + k3(1), y+k3(2),z+k3(3));

x=x+1/6*(k1(1)+2*k2(1)+2*k3(1)+k4(1));
y=y+1/6*(k1(2)+2*k2(2)+2*k3(2)+k4(2));
z=z+1/6*(k1(3)+2*k2(3)+2*k3(3)+k4(3));

x=vpa(x,20);
  y=vpa(y,20);
  z=vpa(z,20);


xtrace(i) = x; 
ytrace(i) = y; 
ztrace(i) = z;
i = i + 1; 
t = t+h;
end


YY=[xtrace;ytrace;ztrace];

plot3(xtrace,ytrace,ztrace)

 