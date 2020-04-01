b = [1];
a = [1 44 1];
[A,B,C,D] = tf2ss(b,a);

e = eig(A);
disp(e);