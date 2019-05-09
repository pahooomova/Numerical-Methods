% квадратурные формулы
clear all
n=20;

syms x
f(x)=1.3*cos(3.5*x)*exp(2*x/3) + 6*sin(4.5*x)*exp(-x/8) + 5*x;

a = 0.7; 
b = 3.2; 
alfa = 0;
beta = 1/4;

p(x)=(x-a)^(-alfa) * (b-x)^(beta);
h=(b-a)/n;

%узлы
xx(1) = a;
for i=2:n
    xx(i)=xx(i-1)+h;  
end

%моменты весовой функции
for s = 1 : n
    mju(s)=int(p*x^(s-1),a,b);
end

%решаем слау
for i=1:n
   for j=1:n
    B(i,j)=xx(j)^(i-1);
   end
end
mju=mju';
A=B\mju;

%квадратурная сумма
S=0;
for i=1:n
   S=S+A(i)*subs(f,x,xx(i)); 
end

S1=vpa(S,10) % по формуле

