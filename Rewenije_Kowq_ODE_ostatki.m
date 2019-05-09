clear all;

A = 1/15;
B = 1/20; 
c2 = 0.125;
eps = 1.0e-12;
delta = 1.0e-13;
y0 = [B*pi A*pi]';
%dy1/dx = Ay2 
%dy2/dx = -By1
D=[0 A;-B 0]; %dy/dx=D*y в матричной форме
ro=2*eps;

[t,X] = ode45('func',[0,pi],y0,1.0e-8);
yk_matlab = X(length(X),:)';

type = 2;
i = 1;
while ro>eps
    h = pi/i;
    [y,ro] = rk(y0,h,i,D,c2,type);
    i=i+1;
end
i = i-1;
yk_matlab-y
h = pi/i; %оптимальный шаг
x = 0:h:pi*3;
rox = [0];
for k = 2:1:length(x)
    [y,r] = rk(y0,h,k,D,c2,type);
    rox = [rox r];
end
figure;
plot(x,rox,'c');% зависимоть погрешности от независимой переменной
hold on;

% aвтоматический выбор шага
type = 2;
h = hx(D,y0,0,pi,type,delta);% выбор начального шага
xk = 0;
y = y0;
step = 0;
Y = y0';
Xk = 0;
h_x = h;
while(pi-xk>0)
    [y1 ro y2] = rk(y,h,1,D,c2,type);
    e = delta*2^type;
    if ro > e
        h = newh(xk,h/2,pi);
    elseif (ro<=e)*(ro>delta)
        y = y2;xk=xk+h;
        h=newh(xk,h/2,pi);
        Y=[Y;y'];
        Xk=[Xk;xk];
        h_x=[h_x;h];
    elseif (ro<=delta)*(ro>=delta/2^(type+1))
        y = y1;
        xk=xk+h;
        h=newh(xk,h,pi);
        Y=[Y;y'];
        Xk=[Xk;xk];
        h_x=[h_x;h];
    elseif ro<delta/2^(type+1)
        y = y1;
        xk=xk+h;
        h=newh(xk,h*2,pi);
        Y=[Y;y'];
        Xk=[Xk;xk];
        h_x=[h_x;h];
    end
    step = step+1;
end
yk_matlab-y
x=0:0.001:pi*3;
h1=[0];
for k=2:1:length(x)
    h1=[h1 hx(D,y0,0,x(k),type,delta)];
end
figure;
plot(Xk,h_x,'k');% зависимоть шага от независимой переменной
