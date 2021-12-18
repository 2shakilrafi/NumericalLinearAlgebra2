function probability = pathprobability(i,j)

xdist = j-i;
ydist = i-j;

probability = (((i+j)/2)^ydist)*(0.5-(i+j)/2)^xdist;

end