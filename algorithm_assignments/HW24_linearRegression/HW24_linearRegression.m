x = [1 2 3 4 5 6]
y = [1 2 1.3 3.75 2.5 100]
% We should filter out x=6,y=100!
[fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

% Actual values for your comparison:
xAnswer = [1 3 2 5 4]
yAnswer = [1 1.3 2 2.5 3.75]
slopeAnswer = 0.4750
interceptAnswer = 0.6850
RsquaredAnswer = 0.4758

% Will show a 1 if your result is within 1.e-12 of the answer.
fprintf("fX is close to xAnswer? %d\n", abs(fX-xAnswer)<1.e-12) % Since fX is an array, will print one line per element.
fprintf("fY is close to yAnswer? %d\n", abs(fY-yAnswer)<1.e-12) % Since fY is an array, will print one line per element.
fprintf("slope is close to slopeAnswer? %d\n", abs(slope-slopeAnswer)<1.e-12)
fprintf("intercept is close to interceptAnswer? %d\n", abs(intercept-interceptAnswer)<1.e-12)
fprintf("Rsquared is close to RsquaredAnswer? %d\n", abs(Rsquared-RsquaredAnswer)<1.e-12)

function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

% Check that x and y data have matching data points
if length(x) ~= length(y)
    error('Number of independent variables must match number of dependent variables!')
end

% Sort y data in ascending order, sort corresponding x data accordingly
[y, sorder] = sort(y);
x = x(sorder);

% Assign quartiles to y value indeces and calculate interquartile range
Q1 = y(floor((length(x)+1)/4));
Q3 = y(floor((3*length(x)+3)/4));
IQR = Q3-Q1;

% Discard outliers
rmv = []; % Initialize storage for position of outliers
for idx = 1:length(x)
    if y(idx) < Q1-1.5*IQR % Check upper fence
        rmv(end+1) = idx;
    elseif y(idx) > Q3+1.5*IQR % Check lower fence
        rmv(end+1) = idx;
    end
end
x(rmv) = []; y(rmv) = []; % Removes outliers using marked positions
fX = x; fY=y;

% Values for finding linear regression line
n = length(x);
xBar = sum(x)/length(x); % x-mean
yBar = sum(y)/length(y); % y-mean
slope = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)^2); % a_1
intercept = yBar-slope*xBar; % a_0
regLine = @(x_i) slope*x_i+intercept; % Define linear regression line

% Values for finding coefficient of determination
S_t = sum((y-yBar).^2); % Sum of squares
S_r = sum((y-regLine(x)).^2); % Sum of squares of residuals
Rsquared = 1-S_r/S_t; % Define coefficient of determination
end