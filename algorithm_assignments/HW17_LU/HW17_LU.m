% Solve the system of equations in the form A*x = b
%   10*x1 + 2*x2 - x3 = 27
%   -3*x1 - 6*x2 + 2*x3 = -61.5
%   x1 + x2 + 5*x3 = -21.5
% Set up A for the given system
A = [10, 2, -1; 
    -3, -6, 2;
    1, 1, 5];
% Set up b
b = [27; -61.5; -21.5];
% Solve for x
x = A\b;

% Test your function
[L, U, P] = luFactor(A)

% How can you test the output of your function is correct?

function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
U = A; % Initialize U Matrix to modify
[m,n] = size(U); % Store matrix dimensions for later use
if m ~= n % Check that the matrix is valid (ie not over or under defined)
    error("Input matrix must be square")
end
P = eye(m,n); % Initialize P Matrix
for col = 1:m-1 % Indexes working section of the matrix
    [~,matPos] = max(abs(U(col:m,col))); % Locates the max value of in the working column
    absPos = matPos+col-1; % Relates relative position in the max matrix to the absolute position of the input matrix
    tempRow = [U(col,:);P(col,:)]; % Stores the working row of the U and P matrix
    % Swap the working row of the U and P matrix with the row containing the max
    U(col,:) = U(absPos,:);
    P(col,:) = P(absPos,:);
    U(absPos,:) = tempRow(1,:);
    P(absPos,:) = tempRow(2,:);
    for row = col+1:m % Row elimination
        U(row,:) = U(row,:)-U(col,:)*U(row,col)/U(col,col);
    end
end
L = P*A/U; % Create L matrix via definition of LU structure
end