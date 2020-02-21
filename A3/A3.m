% Skeleton for COGS 189 A3
% 
% Please refer to this file when the Google Doc asks you to.


%---------------------------------------
% Q2 -- Simple "Cross-Validation"
%
% Goal: Create a 5-fold "CV" loop
Q2_data = [1, 2, 3, 4, 5];

% Create a for loop which takes Q2_data and
% prints two things every iteration:
%  1. The number of our iterator
%  2. Every other number in Q2_data
%
% Use i as your iterating variable
i = 1;

% You will find the following lines of code very useful:
disp(i)
disp(find(Q2_data ~= i))

% WRITE YOUR FOR LOOP HERE
% WRITE YOUR FOR LOOP HERE
% WRITE YOUR FOR LOOP HERE
% WRITE YOUR FOR LOOP HERE

% Output should be:
%1
%2     3     4     5
%2
%1     3     4     5
%3
%1     2     4     5
%4
%1     2     3     5
%5
%1     2     3     4

%---------------------------------------
% Q5
% TO BE WRITTEN