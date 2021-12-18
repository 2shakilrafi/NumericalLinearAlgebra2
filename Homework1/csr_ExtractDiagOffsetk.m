function diag = csr_ExtractDiagOffsetk(AA,JA,IA,offset)


[~,n] = deal(length(IA)-1,length(IA)-1);                                   % we first start by extraction the dimensions of the matrix from IA
diag = nan(1,n);                                                           % as per convention the * is indicated by a nan

if offset > 0                                                              % we have two cases k > 0, k < 0, k=0, we start with k> 0
    for i = 1:n-offset                                                     % for 1 to n-k 
        reconstructedRowi = zeros(n);                                      % we start by reconstructing the rows, initializing them first to zer
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);      % and dropping in the values from AA at the positions indicated by JA
        diag(i) = reconstructedRowi(i+offset);                             % and reading the values at i+offset
    end

elseif offset < 0                                                          % for k < 0  we do the same process
    for i = abs(offset)+1: n                                               % but for |k|+1:n
        reconstructedRowi = zeros(n);
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);    
        diag(i) = reconstructedRowi(i+offset);
    end
else
    for i = 1:n                                                            % the same process repeated for k = 0
        reconstructedRowi = zeros(n);
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);    
        diag(i) = reconstructedRowi(i+offset);
    end
end

end