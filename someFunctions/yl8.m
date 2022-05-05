function [area] = yl8(func,aBnd,bBnd)
% Simpsons 3/8 rule
%
% Inputs: (func,a,b)
% func = the function to be evaluated
% a,b = Upper and lower bounds
x = linspace(aBnd,bBnd,4);
y = func(x);
area = 0.375*((bBnd-aBnd)/3)*(y(1)+3*y(2)+3*y(3)+y(4));
end