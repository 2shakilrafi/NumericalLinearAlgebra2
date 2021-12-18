function nz = csr_CountNonZero(AA,JA,IA)

% this function takes a matrix in csr format with AA, JA, and IA and
% outputs nz the number of non-zero elements in the main diagonal of the
% matrix

[m,n] = deal(length(IA)-1,length(IA)-1);                                   % we start by calculating m,n for our matrix
diag = zeros(n);                                                           % diagonal is set to zeros

for i = 1:m                                                                % for 1 to m
       reconstructedRowi = zeros(1,n);                                     % we initialize reconstructed row as a row of zeros
       reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);       % we then drop the values from AA according to the position in JA    
       diag(i) = reconstructedRowi(i);                                     % we read the diagonal element off
end
nz = nnz(diag);                                                            % nz is the number of non-zero elements in diag
end

