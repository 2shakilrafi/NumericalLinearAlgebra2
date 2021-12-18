function nz = diag_CountNonZero(diag, ioff)

    nz = nnz(diag(:,ioff == 0)); % just count the number of non-zero elements where ioff=0

end

