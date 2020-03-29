clc; clearvars;
syms x(t) t s X F;
Dx = diff(x,t);
D2x = diff(x,t,2);
ode = D2x == 4*x + 1 - 2*sin(2*t) + 2*Dx ;
F = laplace(ode, t, s);
F = subs(F, laplace(x,t,s), X);
F = subs(F,x(0), 0);
F = subs(F, subs(Dx, t, 0), 3);
X = solve(F, X);
x = ilaplace(X);

