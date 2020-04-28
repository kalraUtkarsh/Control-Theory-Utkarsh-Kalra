p1=-1;
p2=-2;
p3=-3;
p4=-4;
A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
D=[0;0];
L = place(A',C',[p1 p2 p3 p4])';

K = place(A,B,[p1 p2 p3 p4]);

unscaled_ob_con_sys = ss(A-B*K-L*C,B,C,D);
figure(7);
step(unscaled_ob_con_sys);
hold on
Kdc = dcgain(unscaled_ob_con_sys);
Kr = 1/Kdc(1, 1);
scaled_os_con_sys=ss(A-B*K-L*C,B*Kr,C,D);
step(scaled_sys);

legend('Unscaled','Scaled');
disp(Kdc);
disp(Kr);