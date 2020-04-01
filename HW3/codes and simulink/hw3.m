s=tf('s');
sys = ((s^2)+3*s+8)/(s^4+3*(s^3)+3*(s^2)+13*s+7);

controlSystemDesigner(sys);