clear
clc
% Two important quantities when studying fermentation are the carbon dioxide
% evolution rate (g/h) and the oxygen uptake rate (g/h). These are calculated
% from expiremental analysis of the inlet and exit gases of the fermentor, and the
% flow rates, temperature, and pressure of these gases
% Time of Fermentation (hours)
time = [140 141 142 143 144 145 146 147 148 149];
% Carbon Dioxide Evolution Rate (g/hour)
CO2evo = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
% Oxygen Uptake Rate (g/hour)
OxUp = [15.59 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68];

% Using your function in part 1, and the data table below, calculate the total
% amount of carbon dioxide produced and oxygen consumed during fermentation.
% Compare to the value that the MATLAB function trapz() computes. You would
% expect the solutions it be similar but not identical

% using the matlab solution
total_CO2_trap = trapz(time, CO2evo);
total_Ox_trap = trapz(time, OxUp);

% using the matlab solution
total_CO2_simp = Simpson(time, CO2evo);
total_Ox_simp = Simpson(time, OxUp);

function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Store the dimensions of the input matrices
[xRow,xCt] = size(x);
[yRow,yCt] = size(y);

% Error conditions
if xCt == 1 % Check for sufficient data input
    error('You cant integrate a point!')
elseif xRow ~= 1 || yRow ~= 1 % Check for vector inputs
    error('Data sets must be in the form of vectors')
elseif xCt ~= yCt % Check for compatible data
    error('Input data does not have matching number of variables')
else
    for pos = 1:xCt-2  % Check data spacing
        gap1 = x(pos)-x(pos+1);
        gap2 = x(pos+1)-x(pos+2);
        if gap1 ~= gap2
            error('Independent variables must be evenly spaced')
        end
    end
end

I = 0; % Initialize a variable to store the area under the curve

% Calculate area under the curve for the given data
if xCt > 2 % Use the simpson's 1/3 rule if there is sufficient data
    for pos = 1:2:xCt-2
        I = I+(x(pos+2)-x(pos))*(y(pos)+4*y(pos+1)+y(pos+2))/6;
    end
end
if xCt == 2 || rem(xCt,2) == 0 % Uses trapezoidal rule if the data is even
    warning('Data set has even number of variables, trapezoidal rule will be used on last interval')
    I = I+(x(xCt)-x(xCt-1))*(y(xCt-1)+y(xCt))/2;
end
end