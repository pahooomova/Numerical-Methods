% КФ типа Гаусса
clear all
n=20;

syms x
f(x)=1.3*cos(3.5*x)*exp(2*x/3) + 6*sin(4.5*x)*exp(-x/8) + 5*x;

a = 0.7; 
b = 3.2; 
alfa = 0;
beta = 1/4;

p(x)=(x-a)^(-alfa) * (b-x)^(beta);

%моменты весовой функции
for s = 1 : 2*n
    mju(s)=int(p*x^(s-1),a,b);
end

%решаем СЛАУ
for s=1:n
   B(s)=-mju(n+s);
   for i=0:n-1
       K(s,i+1) = mju(s+i);
   end
end
B= B';
A = K\B;

%находим узлы как корни узлового многочлена
w(1)=1;
for i = 2:n+1 
    w(i) = A(n-i+2);
end
xx = roots(w)

for i=1:n
   mu(i)= mju(i);
end


% решаем СЛАУ
for i=1:n
   for j=1:n
    B(i,j)=xx(j)^(i-1);
   end
end
mu=mu';
A=B\mu;


S=0;
for i=1:n
   S=S+A(i)*subs(f,x,xx(i));
end

S2=vpa(S,10) % по формуле
