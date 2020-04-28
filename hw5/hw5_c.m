p1=-1;
p2=-2;
p3=-3;
p4=-4;
A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
D=[0;0];
L = place(A', C',[p1 p2 p3 p4])';
new_eig = eig(A-L*C);
%sys1 = ss(A,B,C,D);
%figure(1);
%step(sys1);
%figure(2);
%sys2 = ss((A-L*C),B,C,D);
%step(sys2);

Q=[1 0 0 0;0 1 0 0;0 0 1 0; 0 0 0 1];
R=1
K= lqr(A,B,Q,R);
sys3 = ss((A-B*K),B,C,D);
figure(3);
step(sys3);
