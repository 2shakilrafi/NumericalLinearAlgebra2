function diag = Cord_ExtractDiagOffsetk(AA,JR,JC,~,n,~,k)

diag = nan(1,n);                            % throughout the homework the convention is that the * symbol in representing diagonals is a NaN, we initialize a diagonal full of NaN

if k > 0                                    % we have three cases, either the offset is negative, positive, or zero, we start with if k>0
    for i = 1:n-k                           % we iterate through the matrix from 1 to n-k
       if isempty(AA(JR == i & JC == i+k))  % we check that the element is indeed zero
           diag(i) = 0;                     % if so our diagonal will have a zero 
       else
           diag(i) = AA(JR == i & JC == i+k);  % if not our diagonal is the non-zero element at that point
       end
    end
elseif k < 0                            % we then see if k < 0
                                        
    for i = abs(k)+1:n                           % if so we iterate from k+1 to n
       if isempty(AA(JR == i & JC == i+k))       % we perfor the same check as before for zero
           diag(i) = 0;                          % if we have a zero, we put zero as our diagonal point
       else
           diag(i) = AA(JR == i & JC == i+k);    % else our diagonal is the non-zero element at that point
       end
    end
else
    for i = 1:n
       if isempty(AA(JR == i & JC == i))         % we repeat the same procedure. 
           diag(i) = 0;
       else
           diag(i) = AA(JR == i & JC == i+k);
       end
    end
     
end