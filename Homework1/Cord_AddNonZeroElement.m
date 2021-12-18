function [AA, JR, JC, m, n, nzmax] = cord_AddNonZeroElement(AA,JR,JC,m,n,nzmax, nzelement, i,j)

% there are two cases to consider: either we are replaceing an existing
% elment, or we are introducing a completely new element to a zero in the
% matrix

if isempty(AA(JR == i & JC ==j)) % in the first case where we're introducing a completely new element to a zero
    JR = [JR i];                 % we add the row to JR
    JC = [JC j];                 % we add to column to JC
    nzmax = nzmax+1;             % we increment nzmax

else                             % if that is not the case
    AA(JR == i & JC == j) = nzelement; % we repace the point in AA with our new nzelement. JR,JC and nzmax remain unchanged

end
end    