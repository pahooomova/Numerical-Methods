% Метод средней точки
clear all
n=20;

syms x
f(x)=1.3*cos(3.5*x)*exp(2*x/3) + 6*sin(4.5*x)*exp(-x/8) + 5*x;

a = 0.7; 
b = 3.2; 
alfa = 0;
beta = 1/4;

p(x)=(x-a)^(-alfa) * (b-x)^(beta);
F(x) = f*p;
h=(b-a)/n; %одинаковые точки

I = 0;
for i = 1 : n
   I = I + subs(F,x,a + ((i - 1/2)*h))*h; % составная формула средней точки
end

I1=int(F,a,b);
I1=vpa(I1,10) % встроенный интеграл
I2=vpa(I,10)  % по формуле


