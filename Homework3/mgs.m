function [Q,R] = mgs(A)

% Program to calculate the QR decomposition of a matrix using modified
% Gram-Schmidt
% Inputs: An mxn matrix A
% Output: The QR decomposition concatenated

n = size(A,2);                                       % set n to be the column size of A     
m = size(A,1);                                       % set m to be the row size of A

for k = 1:n                                          % index k to iterate from 1 to n
    R(k,k) = norm(A(1:m,k));                         % the k,k th entry of R is the norm of the kth column
    Q(1:m,k) = A(1:m,k)/R(k,k);                      % the kth colum is the kth column of A divided (in the matrix sense) by the k,kth entry in R
    for j = (k+1):n                                  % index j iterates from k+1 to n
        R(k,j) = Q(1:m,k).' * A(1:m,j);              % The k,jth entry of R is the transpose of the kth column of Q times the jth column of A
        A(1:m,j) = A(1:m,j) - Q(1:m,k) * R(k,j);     % the jth column of A is the jth column of A minus the kth column of Q times entry k,j of R
    end 
end


end

