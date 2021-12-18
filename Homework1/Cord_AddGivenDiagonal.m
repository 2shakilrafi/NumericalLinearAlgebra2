function [AA, JR, JC,m,n,nzmax] = Cord_AddGivenDiagonal(AA,JR,JC,m,n,nzmax, diag, k) 

% this function takes a matrix in coord format with AA, JR, JC, m,n,nzmax
% and a diagonal with an offset to give  a new AA, JR, JC, m, n, nzmax

if k > 0                                             % the first case is is k > 0

    for i = 1:k                                      % if so we iterate from i = 1:k
        if isempty(AA(JR == i & JC == i+k))          % we check that the value does not already have a co-ordonate
            AA = [AA diag(i)];                       % if not we append AA with the element in that diagonal
            JR = [JR i];                             % we append JR with the i of the given element
            JC = [JC j];                             % we append JC with j
            nzmax = nzmax+1;
        else   
            AA(JR ==i & JC ==i+k) = diag(i);         % if the coordinate exists we replace the element at that coordinate, everything else remains the same
        end
    end

elseif k < 0                                         % for the case that k < 0                  
    for i = abs(k)+1:n
        if isempty(AA(JR == i & JC == i+k))          % we perform the same checks as before
            AA = [AA diag(i)];                       % and do the same operations as before
            JR = [JR i];
            JC = [JC j];
            nzmax = nzmax+1;
        else   
            AA(JR ==i & JC ==i+k) = diag(i);
        end
    end
else
    for i = 1:n                                      % for k = 0 we do the same checks
     
        if isempty(AA(JR == i & JC == i))            % and perform the same operations as before
            AA = [AA diag(i)];
            JR = [JR i];
            JC = [JC i];
            nzmax = nzmax+1;
        else   
            AA(JR ==i & JC ==i) = diag(i);
        end
    end
   
end
    
        

end 