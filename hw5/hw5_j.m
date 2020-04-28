A=[0 0 1 0; 0 0 0 1; 0 2.2810 -0.0862 0; 0 -207.7090 -0.15124 0];
B=[0;0;0.0862;0.15124];
C=[1 0 0 0;0 1 0 0]; 
D=[0;0];
P =[-1 -2 -3 -4];
K = place(A,B,[p1 p2 p3 p4]);

unscaled_ob_con_sys = ss(A-B*K-L*C,B,C,D);

Kdc = dcgain(unscaled_ob_con_sys);
Kr = 1/Kdc(1, 1);
scaled_os_con_sys=ss(A-B*K-L*C,B*Kr,C,D);

Acl = A-B*K-L*C;
Bcl=B*Kr;
Ba = [Bcl [0;0;0;0] [1;1;1;1]];
rng default;
Da = [D [1;1] [0;0]];
t = 0 : 0.01 : 10;
w=randn(1,length(t));
u = sin(t);
v = rand(1, length(t));
ua=[u; v; w];
sys = ss(Acl,Ba,C,Da);
figure(9);
subplot(1,2,1);
lsim(scaled_os_con_sys, u, t);
title('no noise');
subplot(1,2,2);
lsim(sys, ua, t);
title('noise in both');

Q=1;
R=1;
[kest, L, P] = kalman(sys, Q, R)
kest = kest(1, :);

s = parallel(sys, kest, 1, 1, [], []);
SimModel = feedback(s, 1, 4, 2, 1);
SimModel = SimModel([1 3],[1 2 3]);
[out, x] = lsim(SimModel, ua, t);

y=out(:, 1);
yf = out(:, 2);

figure(12);
plot(t, y, 'r', t, yf, 'b');
hold on 
[yn, x] = lsim(sys, ua, t);
plot(t, yn(:, 1), '--g');
title('Kalman filter');
legend('true','kalma','noisy');
grid

K = lqry(sys, Q, R);
[kest, L, P] = kalman(sys, Q, R);
rlqg = lqgreg(kest, K);
figure(13);
lsim(rlqg(1, 1), u, t);
title('LGQ');
grid;