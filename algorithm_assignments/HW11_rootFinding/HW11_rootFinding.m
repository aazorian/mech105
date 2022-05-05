clear
clc

% Create a test function to test falsePosition function. 
% It is best to choose something where you already know the answer so it is
% easy to check if the solution your algorithms gives is correct.
% Polynomials are a nice starting place, since we have equations for the roots
testFunc = @(x) x.^3; % the root for this is pretty clearly x=0

% now lets test the function, using default value for es
x_left = -1;
x_right = 1;
[root, fx, ea, iter] = falsePosition(testFunc, x_left, x_right);

function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% Set es and maxit to defaults if no inputs are provided
if nargin < 4
    es = 0.0001;
    maxit = 200;
elseif nargin < 5
    maxit = 200;
end
ea = es+1; % Initialize ea such that the while loop will always run at least once
iter = 0; % Initialize iteration tracking variable
xp = xl; % Use xl as the zero iteration guess
% While loop runs until ea drops below es or the max number of iterations is reached
while ea > es && iter <= maxit
    iter = iter+1; % Index iteration variable
    % Evaluate function at bounds for easier use later
    fl = func(xl);
    fu = func(xu);
    xr = xu-(fu*(xl-xu))/(fl-fu); % Make guess at root using false position formula
    % Check for valid input bounds and if our initial guess is a root
    if fl*fu > 0
        error('Bounds do not bracket a root')
    elseif func(xr) == 0
        ea = 0;
        break % Exit while loop if root is already found, no sense in calculating more
    end
    ea = abs((xr-xp)/xr)*100; % Evaluate error of our guess
    % Set xr to new bound with appropriate sign
    if xl*xr > 0
        xl = xr;
    else
        xu = xr;
    end
    xp = xr; % Store previous guess for error analysis next iteration
end
root = xr; % Set output to adequate guess
fx = func(root); % Output value of function at the approximate root
end