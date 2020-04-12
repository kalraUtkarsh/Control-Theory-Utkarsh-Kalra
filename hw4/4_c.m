syms dx dtheta ddx  theta ddtheta x m M l g u

jacobian([dx, dtheta, (dtheta^2*3.636*sin(theta) - 35.316*sin(theta)*cos(theta) + u)/(3.6*cos(theta)^2 - 3.6 - 3.6), (3.636*dtheta^2*sin(theta)*cos(theta) - (7.2)*9.81*sin(theta) + cos(theta))/(3.636*cos(theta)^2-3.636-3.636)], [x, theta, dx, dtheta])


