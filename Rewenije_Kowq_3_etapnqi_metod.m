clear all;

c2 = 0.3; 
A = -1; 
B = -3; 
C = 3;
h=0.01;



syms x y1 y2 y3 y4

% Задача Коши
f(x,y1,y2,y3,y4) =[  2*x*y2^(1/B)*y4;
                     2*B*x*exp(B/C*(y3-A))*y4;
                     2*C*x*y4;
                     -2*x*log(y1)               ];

%начальные условия
x=0;
y1=1;
y2=1;
y3=A;
y4=1;
 
%для сохранения координат
xtrace = x; 
y1trace = y1; 
y2trace = y2;
y3trace = y3;
y4trace = y4;
i = 1;  

while x <=5
% 3хэтапный метод
k1 = h*f(x, y1,y2,y3,y4);
k2 = h*f(x + h/3, y1+k1(1)/3,y2+k1(2)/3,y3+k1(3)/3,y4+k1(4)/3);
k3 = h*f(x + 2*h/3, y1+2*k2(1)/3,y2+2*k2(2)/3,y3+2*k2(3)/3,y4+2*k2(4)/3);



y1=y1+1/4*(k1(1)+3*k3(1));
y2=y2+1/4*(k1(2)+3*k3(2));
y3=y3+1/4*(k1(3)+3*k3(3));
y4=y4+1/4*(k1(4)+3*k3(4));

 y1=vpa(y1,20);
 y2=vpa(y2,20);
 y3=vpa(y3,20);
 y4=vpa(y4,20);

xtrace(i) = x; 
y1trace(i) = y1; 
y2trace(i) = y2;
y3trace(i) = y3;
y4trace(i) = y4;
i = i + 1; 
x = x+h;
end

Y=[y1;y2;y3;y4]

%точное решение
syms x
z1(x) = exp(sin(x^2));
z2(x) = exp(B*sin(x^2));
z3(x) = C*sin(x^2)+A;
z4(x) = cos(x^2);

Z=[z1(5);z2(5);z3(5);z4(5)];
Z=vpa(Z,20)

r=abs(Z-Y)

YY=[y1trace;y2trace;y3trace;y4trace];
ZZ=[z1(xtrace);z2(xtrace);z3(xtrace);z4(xtrace)];
plot(xtrace,YY,'c',xtrace,ZZ,'k')




