A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
OM = obsv (A, C) ; 
unobservable = length(A)- rank(OM);

D= eig(A);
disp(D);