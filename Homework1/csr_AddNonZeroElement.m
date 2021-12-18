function [AA,JA,IA] = csr_AddNonZeroElement(AA,JA,IA, nzelement, i, j)

% this function takes a matrix in csr format with AA,JA,IA and a non-zer
% element nzelement with co-ordinates i and j and adds it to our matrix the
% output is in csr format with new AA, JA, IA

if (JA == j) && any(iselement(AA(IA(i):IA(i+1)-1,nzelement)))              % first we check that our element does not already have a co-ordinate
    AA((JA == j) & (AA(IA(i):IA(i+1)-1) == nzelement)) = nzelement;        % if so we replace the AA co-ordinate with our nzelement
    if j <= JA(IA(i))                                                      % if j is less than the column position of the first element in that row
        JA(IA(i)) = j;                                                     % we replace the co-ordinate at JA with our j   
        IA(i) = nzelement;
    end
else                                                                       % if the co-ordinate is new
    jpos = sum((JA(IA(i):IA(i+1)-1)) <= j);                                % we calculate the position where our new j would be
    CombinedAAJA = [AA ; JA];                                              % for simplification we combine vertcat AA and JA to give AAJA
    newCombinedAAJA = [CombinedAAJA(:,1:jpos-1) [nzelement; j] CombinedAAJA(:,jpos+1:size(AA))]; % we insert a column vector [nzelement; j] at the right position
    if j <= JA(IA(i))
        JA(IA(i)) = j;                                                     % we perform the same check as before that IA needs to changed or not
        IA(i) = nzelement;
    end
    AA = newCombinedAAJA(1,:);                                             % our new AA is row 1
    JA = newCombinedAAJA(2,:);                                             % our new JA is row 2
    
end

end