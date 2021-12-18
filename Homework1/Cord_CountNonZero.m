% Homework 1: Numerical Linear Algebra
% Shakil Rafi
% 2020-09-13

function nz = cord_CountNonZero(AA,JR,JC,m,n,nzmax)

% A function to calculate the number of nz elements in the diagonal of a
% matrix in co-ordinate format


nz = nnz(JR == JC); %the number of non-zero elements are the number of non-zero elements where JR == JC

end

