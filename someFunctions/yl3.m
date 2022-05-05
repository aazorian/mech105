function [area] = yl3(func,aBnd,bBnd)
% Simpsons 1/3 rule
%
% Inputs: (func,a,b)
% func = the function to be evaluated
% a,b = Upper and lower bounds
x = linspace(aBnd,bBnd,3);
y = func(x);
area = ((bBnd-aBnd)/2)*(y(1)+4*y(2)+y(3))/3;
end