%% Fixed Pt. Iter.
clear
clc

x_i = 5;
e_a = 1;
e_s = 0.05;
iter = 0;
while e_a > e_s
    x = sqrt((1.7*x_i+2.5)/0.9);
    e_a = abs((x-x_i)/x);
    x_i = x;
    iter = iter+1;
end

%% Newton-Raphson
clear
clc

x_i = 0.5825;
e_a = 1;
e_s = 0.01;
iter = 1;
while e_a > e_s
    x = x_i-(x_i^5-16.05*x_i^4+88.75*x_i^3-192.0375*x_i^2+116.35*x_i+31.6875)/(5*x_i^4-64.2*x_i^3+266.25*x_i^2-384.075*x_i+116.35);
    e_a = abs((x-x_i)/x)*100;
    x_i = x;
    iter = iter+1;
end

%% Newton-Raphson Fixed-Iter.
clear
clc

x_i = 4.5;
iter = 10;
for index = 1:iter
    x_i = x_i-(0.5*x_i^3-4*x_i^2+6*x_i-1)/(1.5*x_i^2-8*x_i+6);
end

%% Secant Method
clear
clc

x0 = 0.4;
xi = 0.5;
es = 0.00001;
ea = es+1;
func = @(x) x^5-16.05*x^4+88.75*x^3-192.0375*x^2+116.35*x+31.6875;
xp = 0;
while ea > es
    x2 = xi-(func(xi)*(x0-xi))/(func(x0)-func(xi));
    x0 = xi;
    xi = x2;
    ea = abs((x2-xp)/x2);
    xp = x2;
end

%% Secant Method Fixed-Iter.
clear
clc

x0 = 0.5;
xi = 0.4;
func = @(x) 7*sin(x)*exp(-x)-1;
iter = 3;
for index = 1:iter
    x2 = xi-(func(xi)*(x0-xi))/(func(x0)-func(xi));
    x0 = xi;
    xi = x2;
end

%% Modified Secant Method
clear
clc

xi = 1;
delta = 0.05;
es = 0.01;
ea = es+1;
func = @(v) (R*T)/(v-b)-a/(v*(v+b)*sqrt(T))-P;
while ea > es
    xl = xi-(func(xi)*delta*xi)/(func(xi+delta*xi)-func(xi));
    ea = abs((xl-xi)/xl)*100;
    xi = xl;
end

%% Modified Secant Method Fixed-Iter.
clear
clc

xi = 0.3;
delta = 0.01;
func = @(x) 7*sin(x)*exp(-x)-1;
iter = 3;
for index = 1:iter
    xi = xi-(func(xi)*delta*xi)/(func(xi+delta*xi)-func(xi));
end