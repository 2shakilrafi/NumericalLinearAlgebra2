function [diag, ioff] = diag_AddNonzeroElement(diag, ioff, nzelement, i, j)

% this function takes a matrix in diag format with diag and ioff, and a
% non-zero element, with co-ordinates i,j

[mDiag, ~] = size(diag);                                          % we initialize the m and n (unused)for our 
offset = j-i;                                                     % offset is j-i

if any(ismember(ioff, offset))                                    % if the offset matches what he have already
    diag(i,offset==ioff) = nzelement;                             % we simply replace the element at that point in the diagonal matrix
    nzelementDiag = zeros(1,mDiag);                               % if not we create a diagonal where the nzelement belongs by initializing to zero
    nzelementDiag(i) = nzelement;                                 % we put our nzelement in that position
    if offset > 0                                                 % if offset > 0 we
        nzelementDiag(mDiag-offset+1:mDiag) = nan;                % we put a set of nan's at the end
    elseif offset < 0                                             % if not we put nan's at the beginning
        nzelementDiag(1:abs(offset)) = nan;
    else
        1==1;                                                     % if k is zero nothing is necessary
    end
      
    combinedIoffDiag = [[ioff; diag] [offset; nzelementDiag']];   % for sorting purposes we horcat ioff and diag and vertcat a matrix with offset on top and nzelementdiag at the bottom
    combinedIoffDiag = (sortrows(combinedIoffDiag'))';            % we column sort
    ioff = combinedIoffDiag(1,:);                                 % we read the first row as the ioff
    diag = combinedIoffDiag(2:end,:);                             % we read the rest as diag
end

end

% UPDATED