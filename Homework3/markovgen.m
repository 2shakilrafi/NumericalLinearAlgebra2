function markov = markovgen(n)

% a function for calculating the markov matrix of the triangular grid
% particle motion problem
% input is an integer n, where k = n-1
% output is a matrix showing the transition probabilities

k= n-1;                                                                                 % we set k to be n-1 by definition
size = 0.5*(k+1)*(k+2);                                                                 % the size of the matrix is calculated using the formula .5(k+1)(k+2)

markov = zeros(size);                                                                   % the output matrix markov is initialized to zer


pointers = [[1:size]; zeros(2,size)];                                                   % we create a pointer matrix. The first row is the number 1-n
pointers(2,:) = repelem([0:k],n:-1:1);                                                  % the second row is the x-coordinates of the pointers

diagextractor = repmat([0:k]',1,k+1);                                                   % we create the y-coordinates by creating first a matrix with 0:n-1 repeated in each column

ycordrow = [];                                             
for i = 0:k                                                                             % we create the y coordinates of the pointers by stripping off diagonals from this matrix
    ycordrow = [ycordrow diag(diagextractor,i)'];
end

pointers(3,:) = ycordrow ;                                                              % we finally add the concatenated stripped off diagonals to get all the y-coordinates

for i = 1:size                                                                          % we start to fill out our transition matrix we fill up until we reach the diagonal
    for j = 1:i-1
        
        if (pointers(2,j)-pointers(2,i)) == 1 && (pointers(3,i) == pointers(3,j))       % if we have a transition to the right
                markov(i,j) = .5- (sum(pointers([2:3],i))/(2*k));                       % we calculate the probability and put it there
                
        elseif (pointers(3,j) - pointers(3,i)) ==1 && (pointers(2,i) == pointers(2,j))  % if we have a transition strictly upward
                markov(i,j) = .5- (sum(pointers([2:3],i))/(2*k));                       % we calculate probability and put it there
                
        elseif (pointers(2,j) - pointers(2,i)) == - 1 && (pointers(3,i) == pointers(3,j)) % if we have a strictly left transition
                markov(i,j) = sum(pointers([2:3],i)) / (2*k);                             % we calculate the probability and put in the entry
                
        elseif (pointers(3,j)-pointers(3,i)) == -1 && (pointers(2,i) == pointers(2,j))   % if we hve a strictly downward transition
                markov(i,j) = sum(pointers([2:3],i)) / (2*k);                            % we calculate that probability
            
        else
                markov(i,j) = 0;                                                        % the diagonal entry is calculated last as the difference from 1
        end
                
            
            
    end
    
    for j = i+1:size                                                                            % we calculate after the diagonal in exactly the same way
        
        
            if ((pointers(2,j)-pointers(2,i)) == 1) && (pointers(3,i) == pointers(3,j))
                markov(i,j) = .5- (sum(pointers([2:3],i))/(2*k));
                
            elseif ((pointers(3,j) - pointers(3,i)) ==1) && (pointers(2,i) == pointers(2,j))
                markov(i,j) = .5- (sum(pointers([2:3],i))/(2*k));
                
            elseif (pointers(2,j) - pointers(2,i)) == - 1 && (pointers(3,i) == pointers(3,j))
                markov(i,j) = sum(pointers([2:3],i)) / (2*k);
                
            elseif (pointers(3,j)-pointers(3,i)) == -1 && (pointers(2,i) == pointers(2,j))
                markov(i,j) = sum(pointers([2:3],i)) / (2*k);
            
            else
                markov(i,j) = 0;
            end
                
        

    end
    
    markov(i,i) = 1 - (sum(markov(i,[1:i-1]))+sum(markov(i,[i+1:size])));               % the diagonal entry is calculated last of all by subtracting all other entries from 1
end

end
            
        







