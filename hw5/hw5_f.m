A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
D=[0;0];

K = place(A,B,[p1 p2 p3 p4]);

unscaled_ob_con_sys = ss(A-B*K-L*C,B,C,D);

Kdc = dcgain(unscaled_ob_con_sys);
Kr = 1/Kdc(1, 1);
scaled_os_con_sys=ss(A-B*K-L*C,B*Kr,C,D);

Acl = A-B*K-L*C;
Bcl=B*Kr;
Ba = [Bcl [0;0;0;0]];
rng default;
Da = [D [1;1]];
t = 0 : 0.01 : 10;
u = sin(t);
v = rand(1, length(t));
ua=[u; v];
sys = ss(Acl,Ba,C,Da);
figure(8);
subplot(1,2,1);
lsim(scaled_os_con_sys, u, t);
title('no noise');
subplot(1,2,2);
lsim(sys, ua, t);
title('noise');