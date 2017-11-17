function dx = linear_system(u)

global a b c d e g 

x = u(1:4);
U = u(5);

a1 = -a/b;
b1 = c*g/b;
c1 = e/b;
d1 = -a1/d;
e1 = -(g/d)*(1 + c/b);
f = -c1/d;

A = [a1 0 0 b1; 1 0 0 0; d1 0 0 e1; 0 0 1 0];
B = [c1 0 f 0];
C = [0 1 0 0 ];
B = B';

dx=A*x+B*U;

