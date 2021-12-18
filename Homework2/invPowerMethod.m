function [evalue, evector] = invPowerMethod(A, atol, shift)

tic
format longg

% a function for calculating the dominant eigenvalue and eigenvector
% inputs are:
% A -- a square matrix
% atol -- absolute tolerance, a criteria for terminating iteration
% 
% outputs are:
% evalue -- the dominant eigenvalue
% evector -- the corresponding eigenvector
%
% m -- the number of rows of A
% n -- the number of columns of A
% q -- a vector of length 1
% lambda --  a vector of eigenvalues, starting with just nan and slowly
% populated by better approximations of lambda the dominant eigenvector

[m,n] = size(A);                                                            % m,n the dimensions of our input vector

if m ~= n                                                                   % if the matrix is not square 
    disp('Matrix is not square');                                           % we give an error message and terminate the program
    return;
end

A = A^(-1);                                                                 % we invert our matrix A
q = randi(100,n,1);                                                         % q is our random vector
Q = nan(n,100);                                                             % Q is a rectangular vector where the column is slowly going to be populated by the approximations to the dominant eigenvector.
Q(:,1) = q/norm(q);                                                         % we normalize so that the length of q is 1 and use that as the first column of our Q
z = nan(n,100);                                                             % z in the canonical inv power method calculation is taken to a be rectangular matrix with columns being slowly populated by z_i
lambda = nan(1,100);                                                        % lambda is a vector of lambdas slowly approximating towards the actual lambda

for i = 2:100                                                               % we iterate from 2 to 100
    z(:,i) = A*Q(:,i-1);                                                    % we find z_i by multiplying A with q_i
    Q(:,i) = z(:,i)/ norm(z(:,i));                                          % the q_i is z_i / the norm of z_i
    lambda(i) = Q(:,i)' * A * Q(:,i);                                        % lambda_i  is now q_i' times A times q_i
    
    if norm(Q(:,i)-Q(:,i-1)) < atol                                         % this is the condition for breaking out
        evalue = 1/lambda(i);                                               % we output evalue from the last lambda(i)
        evector = Q(:,i);                                                   % the eigenvector is the last column of Q(i)
        toc
        plot([1:i],lambda(1:i))
        return;
    end
end


disp('Computation timed out');                                              % this is the computation time-out
evalue = 1/lambda(end);
evector = Q(:,end);

toc

plot([1:i],lambda)
end