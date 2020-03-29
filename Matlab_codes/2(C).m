syms x(t)
Dx = diff(x);

ode = diff(x,t,2) == 4*x + 1 - 2*sin(2*t) + 2*diff(x,t) ;
cond1 = x(0) == 0;
cond2 = Dx(0) == 3;

conds = [cond1 cond2];
XSol(t) = dsolve(ode,conds);
XSol = simplify(XSol);
fplot(XSol)