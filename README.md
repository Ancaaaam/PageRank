# PageRank

Implemented Google's PageRank algorithm in Matlab in two different ways: one algebraic and one iterative.
In PageRank, Iterative and Algebraic functions it is used the same reading of input : all the data is stored in an array from which
we take the N(total number of pages) , E matrix and val1 and val2 numbers. The, the M matrix is constructed, which is defined
as : M(i,j)= 1/L(pj) if j links to i and 0 otherwise(L(pj) is the second number from the each line of E matrix). If a page links to itself,then
M(i,i)=0 and M(i,j)=1/(L(pj)-1). To find out if a page links to itself, for every i - line I initialize a variable named ok with 1. If I find 
in the i line  of E another i, then ok=0.

In Iterative function, we initialize the PR column vector with 1/N and the computation R(t+1) = d * M * R(t) + (1- d) / N
(d is the damping factor) is made for each page at a time point, then repeated for the next time point, until norm(R-PR)
becomes less than eps.

In Algebraic function, we compute the inverse of -d*M matrix using PR_Inv function and multiply it with (1-d)/N column matrix.

In PR_Inv function, we compute matrix inversion algorithm via Gram-Schmidt QR decomposition. 

In Apartenenta function , we calculate the importance grade of a page, using mathematical proprietes. 

In PageRank function, we call the Algebraic and Iterative functions. Then , we sort the values from R2(which is R in Algebraic
function) in descending order to output the pages. After that, we compute the F matrix which contains in every F(i) the output of
Apartenenta(R2(i),va1l,val2).
