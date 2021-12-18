function [diag, ioff] = diag_AddGivenDiagonal(diag, ioff, givenDiag, offset)

% this functions takes a matrix in diagonal format with diag and ioff and a
% given diag givenDiag as a horizontal matrix, and and offset and outputs a matrix in diag format
% with the given diagonal added to the matrix

if any(ismember(ioff,offset))                                      % we check that the diagonal is not already replacing an existing diag
    diag(:,ioff == offset) = givenDiag;                            % if so we simply replace the column vector in the diag matrix at that point
else
    combinedDiagIoff = [ioff; diag];                               % if not, for later convenience in sorting we create something called the combinedDiagIoff
    combinedDiagIoff = [combinedDiagIoff [offset; givenDiag']];    % we horcat to the combinedDiagIoff the [offset; givenDiag']
    combinedDiagIoff = (sortrows(combinedDiagIoff'))';             % we then sort by the first row, matlab apparently does not have something called sortcolumns so we transpose, sortrows, and transpose back *sigh*
    
    ioff = combinedDiagIoff(1,:);                                  % we read the first row as our new ioff
    diag = combinedDiagIoff(2:end,:);                              % the rest of the matrix is now our new diag
end
        
end
    