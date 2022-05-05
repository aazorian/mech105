function [pcent] = perror(of,is)
% Takes two inputs, finds the percent error of the second relative to the
% first
pcent = abs(of-is)/of*100;
end