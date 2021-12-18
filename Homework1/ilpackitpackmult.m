% Homework 1: Numerical Linear Algebra 2
% Shakil Rafi
% 2020-11-13



function C = ilpackitpackmult (coefA, jcoefA, B) % the inputs tot his function are coefA and jcoefA, A in ilpack-itpack format, and  a column vector B

[m,n] = deal(size(coefA,1), max(max(jcoefA))); % we initialize m and n as the m of coefA and jcoef as the largest value in jcoef

if n ~= size(B,1) 
    printf("Dimensions do not match for multiplication") %we do a basic validation to check that multiplication with B is indeed safe
    return;
end

C = zeros(m,1);                         % as is convenction, we initialize C the product matrix as a column of zeros
for i = 1:m
    rowi = zeros(1,n);                  % we reconstruct rowi  of matrix A by initializing to zero
    rowi(jcoefA(i,:)) = coefA(i,:);     % and then dropping the values from coefA to the positions indicated by jcoefA
    C(i) = dot(rowi,B);                 % then we do the traiditonal dot multiplication
end

end

