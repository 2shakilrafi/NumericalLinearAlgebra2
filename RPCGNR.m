function x = RPCGNR(A,b, x0, tol)
% This function does Right Preconditioned Conjugate Gradient for Normal
% Residue
% 



[~,n] = size(A);
U = nan(n,100);
R = nan(n,100);
X = nan(n,100);
X(:,1) = x0;
Z = nan(n,100);
P = nan(n,100);
Rtilde = nan(n,100);
Alpha = nan(1,100);
Beta = nan(1,100);

U(:,1) = M*X(:,1);
R(:,1) =  b - A * (M\U(:,1));
Rtilde(:,1) = A' * R(:,1);
Z(:,1) = Rtilde(:,1)/M;
P(:,1) = Z(:,1);

for j = 1:100
    w = A * M\P(:,j);
    Alpha(j) = dot(Z(:,j),Rtilde(:,j)) / (norm(w)*norm(w));
    U(:,j+1) = U(:,j) + Alpha(:,j) * P(:,j);
    R(:,j+1) = R(:,j) - Alpha(:,j) * w;
    Rtilde(:,j+1) = A' * R(:,j+1);
    Z(:,j+1) = Rtilde(:,j+1)/inv(M);
    Beta(j) = dot(Z(:,j+1),Rtilde(:,j+1)) / dot(Z(:,j),Rtilde(:,j));
    P(:,j+1) = Z(:,j+1) + Beta(j) * P(:,j);
    if X(:,j) - X(:,j-1) <= tol
        break;
    end
end

x = M\U(:,j); 


