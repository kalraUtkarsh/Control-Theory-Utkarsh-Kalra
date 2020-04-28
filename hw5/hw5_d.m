p1=-1;
p2=-2;
p3=-3;
p4=-4;
A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
D=[0;0];
K = place(A, B,[p1 p2 p3 p4]);
Acl = A-B*K;

unscaled_system=ss(Acl,B,C,D);
figure(6);
step(unscaled_system);
hold on
Kdc = dcgain(us);
Kr = 1/Kdc(1, 1);
scaled_sys=ss(Acl,B*Kr,C,D);
step(scaled_sys);
figure(5);
legend('Unscaled','Scaled');
disp(Kdc);
disp(Kr);

