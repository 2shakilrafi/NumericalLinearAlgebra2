function [evalue, evector] = raylieghQuotientIteration(A, atol)

tic

format longg


[m,n] = size(A);


if m ~= n                                                                   % if the matrix is not square 
    disp('Matrix is not square');                                           % we give an error message and terminate the program
    return;
end


q = randi(100,n,1);                                                         % q is our random vector
Q = nan(n,100);                                                             % Q is a rectangular vector where the column is slowly going to be populated by the approximations to the dominant eigenvector.
Q(:,1) = q/norm(q);                                                         % we normalize so that the length of q is 1 and use that as the first column of our Q
z = nan(n,100);                                                             % z in the canonical power method calculation is taken to a be rectangular matrix with columns being slowly populated by z_i

alpha = nan(1,100);                                                         % alpha is our shift vector to be populated by shifts 

for i = 1:99                                                                % we start an iteration from 1 to 99
    alpha(i) = Q(:,i)' * A * Q(:,i);                                        % our first shift is the first column of Q (that is q a vector of length 1) transpose with A and times Q                      
    z(:,i+1) = (A - (alpha(i) * eye(n))) \ Q(:,i);                       % we solve for z_k+1                                                            
    Q(:,i+1) = z(:,i+1) / norm(z(:,i+1));                                   % we solve for the next column of Q
       
    
    if norm(Q(:,i+1)-Q(:,i)) < atol                                         % this is the condition for breaking out
        evalue = alpha(i);                                                  % we output evalue from the last lambda(i)
        evector = Q(:,i);                                                   % the eigenvector is the last column of Q(i)
        toc
        plot([1:i],alpha(1:i))
        return;
    end
end

disp('Computation timed out');                                              % this is the computation time-out
evalue = alpha(end);
evector = Q(:,end);

toc

plot(i,alpha)

end