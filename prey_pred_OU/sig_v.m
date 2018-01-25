% u and v are vectors, i.e., x=[1;2;3] and y=[3;4;5]
function covv = sig_v(x,y)    

% A is the matrix, i.e., A = [1 3;2 4;3 5]
A = [x y];      

% calculating the mean of teo colums x and y
v = var(A); 
% v = cov(A); 


covv = v';