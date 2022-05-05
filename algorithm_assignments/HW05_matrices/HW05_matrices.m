clear
clc

matrix = specialMatrix(10,8);

function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice

% Check that user has entered the correct number of inputs
if nargin ~= 2
    error('Invalid number of inputs!')
end

A = ones(n,m);

% Now the real challenge is to fill in the correct values of A

% Assigns the first row and column their respective numbers
for rowIndex = 2:n
   A(rowIndex,1) = rowIndex;
end
for colIndex = 2:m
   A(1,colIndex) = colIndex;
end

% Set each position in the array to the sum of the positions above it and to the left
for row = 2:n
    for col = 2:m
        A(row,col) = A(row-1,col) + A(row,col-1);
    end
end

end
% Things beyond here are outside of your function