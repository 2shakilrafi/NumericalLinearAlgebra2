function ExtractedDiag = diag_ExtractDiagOffsetk(diag, ioff, k)

% this function takes a matrix in diag format with diag and ioff and ofset
% k and displays the diagonal corresponding to the offset

ExtractedDiag = diag(:,ioff == k); % we simply read the column from diag corresponding to the offset

end