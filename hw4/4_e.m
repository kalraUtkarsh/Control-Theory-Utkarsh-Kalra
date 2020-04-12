A=[0 0 1 0; 0 0 0 1; 0 9.81 -0.2778 0; 0 -19.4257 -0.2775 0];
B=[0;0;0.2778;0.2775];
G=[B A*B A*A*B A*A*A*B];
disp(G)
k= rank(A);
l= rank(G);
disp(k);
disp(l);