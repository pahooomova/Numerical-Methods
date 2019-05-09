c2 = 0.95; 
A = -1; 
B = -1; 
C = -3;

eps = 10^(-12);
eps2=10^(-6);

b2 = 0.5 / c2;
b1 = 1 - b2;
a12 = c2;

syms x y1 y2 y3 y4
f(x,y1,y2,y3,y4) =[2*x*y2^(1/B)*y4; 2*B*x*exp(B/C*(y3-A))*y4;2*C*x*y4; -2*x*log(y1)];


x=0;
xh = 0;
y1=1;
y2=1;
y3=A;
y4=1;

yh1=1;
yh2=1;
yh3=A;
yh4=1;

del = (1/5)^3+(norm(f(x,y1,y2,y3,y4)))^3;
h = (eps2/del)^(1/3);

i = 1;  
ih = 1;
allx(i) = x; 
ally1(i) = y1; 
ally2(i) = y2;
ally3(i) = y3;
ally4(i) = y4;

allxh(i) = x; 
allyh1(i) = y1; 
allyh2(i) = y2;
allyh3(i) = y3;
allyh4(i) = y4;
p=0;
while x <= 5
    k1=h*f(x,y1,y2,y3,y4);
    k2=h*f(x+c2*h,y1+a12*k1(1),y2+a12*k1(2),y3+a12*k1(3),y4+a12*k1(4));

    
    x = x+h
    y1=y1+b1*k1(1)+b2*k2(1);
    y2=y2+b1*k1(2)+b2*k2(2);
    y3=y3+b1*k1(3)+b2*k2(3);
    y4=y4+b1*k1(4)+b2*k2(4);

    y1=vpa(y1,10);
    y2=vpa(y2,10);
    y3=vpa(y3,10);
    y4=vpa(y4,10);
    
    
    i = i + 1; 
    allx(i) = x; 
    ally1(i) = y1; 
    ally2(i) = y2;
    ally3(i) = y3;
    ally4(i) = y4;
    
    h2=h/2;
    
    for u = 1:2
        k1h=h2*f(xh,yh1,yh2,yh3,yh4);
        k2h=h2*f(xh+c2*h2,yh1+a12*k1h(1),yh2+a12*k1h(2),yh3+a12*k1h(3),yh4+a12*k1h(4));
        
        
        xh = xh + h2;
        yh1=yh1+b1*k1h(1)+b2*k2h(1);
        yh2=yh2+b1*k1h(2)+b2*k2h(2);
        yh3=yh3+b1*k1h(3)+b2*k2h(3);
        yh4=yh4+b1*k1h(4)+b2*k2h(4);

        yh1=vpa(yh1,10);
        yh2=vpa(yh2,10);
        yh3=vpa(yh3,10);
        yh4=vpa(yh4,10);
    end
    
    rr1 = norm(yh1-y1)/(1-2^(-2));
    rr2 = norm(yh2-y2)/(1-2^(-2));
    rr3 = norm(yh3-y3)/(1-2^(-2));
    rr4 = norm(yh4-y4)/(1-2^(-2));
    
    if (rr1 > eps2*4)
        h=h/2;
    end
    if (rr1 < eps2*4 && rr1 > eps2)
        h = h/2;
    end
    if (rr1 < eps2 && rr1 > eps2/8)
        h = h;
    end
    if (rr1 < eps2/8)||(rr2 < eps2/8)
        h = 2*h;
    end
   

    p=p+10;
end
YY=[ally1;ally2;ally3;ally4];
plot(allx,YY)