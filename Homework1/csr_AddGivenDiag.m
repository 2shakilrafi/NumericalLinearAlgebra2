function [AA,JA,IA] = csr_AddGivenDiag(AA,JA,IA, givenDiag, offset)

% THIS CODE DOES NOT RUN
% 
% this function takes a matrix in csr format with AA, JA, IA, and a
% givenDiag, with offset and produces a matrix also in csr format with new
% AA, JA, IA


[~,n] = deal(length(IA)-1,length(IA)-1);                                                             % we extract m,n from IA

if offset > 0                                                                                        % if the offset is > 0
    for i = 1:n-offset                                                                               % we loop through from 1 to n
        reconstructedRowi = zeros(1,n);                                                              % we reconstruct each row in turn
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);                                % from the data in AA and JA
        
        if any(ismember(reconstructedRowi,givenDiag(i))) && any(ismember(JA(IA(i):IA(i+1)-1)))       % if the coordinate exists
            
            reconstructedRowi(i+offset) = diag(i);                                                   % we rewrite using the reconstructed row
            AA(IA(i):IA(i+1)-1) = reconstructedRowi(reconstructedRowi ~= 0);                         % the data is rewritten
            if JA(IA(i)+1) < i + offset                                                              % we check that we need to rewrite JA
                JA(IA(i)+1) = i + offset;                                                            % and rewrite JA
            end
        else
            
            concatenatedJAAA = [[JA(IA(i):IA(i+1)-1) ; AA(IA(i):IA(i+1)-1)] [i+offset; diag(i)]];    % if the coordinate does not exist we create a concated JAAA 
            concatenatedJAAA=(sortrows(concatenatedJAAA'))';                                         % we sort that particular section (i to i+1 position)
            
            if JA(IA(i)+1) < i + offset                                                              % we check that JA needs to be changed
                JA(IA(i)+1) = i + offset;                                                            % and change should we need to
            end
                       
            AA = [AA(2:i-1) concatenatedJAAA(2,:) AA(i+1, end)];                                     % we read AA as the first row
            JA = [JA(1:i-1) concatenatedJAAA(1,:) JA(i+1, end)];                                     % we read JA as the second row
        end
    end
elseif offset < 0
                                                                                                     % we repeat the same process if offset < 0
    for i = offset+1:n
        reconstructedRowi = zeros(1,n);
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);
        if any(ismember(reconstructedRowi,givenDiag(i))) && any(ismember(JA(IA(i):IA(i+1)-1)))
            reconstructedRowi(i+offset) = diag(i);
            AA(IA(i):IA(i+1)-1) = reconstructedRowi(reconstructedRowi ~= 0);
            if JA(IA(i)+1) < i + offset
                JA(IA(i)+1) = i + offset;
            end
        else
            
            concatenatedJAAA = [[JA(IA(i):IA(i+1)-1) ; AA(IA(i):IA(i+1)-1)] [i+offset; diag(i)]];
            concatenatedJAAA = (sortrows(concatenatedJAAA'))';
            if JA(IA(i)+1) < i + offset
                JA(IA(i)+1) = i + offset;
            end
                       
            AA = [AA(2:i-1) concatenatedJAAA(2,:) AA(i+1, end)];
            JA = [JA(1:i-1) concatenatedJAAA(1,:) JA(i+1, end)];
        end
    end
    
else
    
    for i = 1:n                                                                                     % we repeat the same process for offset == 0
        reconstructedRowi = zeros(n);
        reconstructedRowi(JA(IA(i):IA(i+1)-1)) = AA(IA(i):IA(i+1)-1);
        if any(ismember(reconstructedRowi,givenDiag(i))) && any(ismember(JA(IA(i):IA(i+1)-1)))
            reconstructedRowi(i) = diag(i);
            AA(IA(i):IA(i+1)-1) = reconstructedRowi(reconstructedRowi ~= 0);
            if JA(IA(i)+1) < i
                JA(IA(i)+1) = i;
            end
        else
            
            concatenatedJAAA = [[JA(IA(i):IA(i+1)-1) ; AA(IA(i):IA(i+1)-1)] [i+offset; diag(i)]];
            concatenatedJAAA = (sortrows(concatenatedJAAA'))';
            if JA(IA(i)+1) < i
                JA(IA(i)+1) = i;
            end
                       
            AA = [AA(2:i-1) concatenatedJAAA(2,:) AA(i+1, end)];
            JA = [JA(1:i-1) concatenatedJAAA(1,:) JA(i+1, end)];
        end
        
   
    end
            
if j <= JA(IA(i))
        JA(IA(i)) = j;                                                     % we check that IA needs to be changed and we change it.
        IA(i) = nzelement;
end            
    







end