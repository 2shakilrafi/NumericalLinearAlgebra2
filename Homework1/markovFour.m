function markov = markovFour

markov = zeros(.5 * 4*5)
[m,n] = size(markov);

for i = 1:m
    for j = 1:n
        markov(i,j) = pathprobability(i,j); 
        
    end
end