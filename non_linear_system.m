%% 
function dx = non_linear_system(u)

global a b c d e g

x = u(1:4);
U = u(5);


A=[(-a*x(1)/(c+b-c*(cos(x(4)))^2))+((c*d*sin(x(4))*x(3)^2)/((c+b-c*(cos(x(4)))^2)))+(c*g*sin(x(4))*cos(x(4))/((c+b-c*(cos(x(4)))^2))); 
    x(1);
    (a*x(1)*cos(x(4))/(d*(c+b-c*cos(x(4))))) - (c*sin(x(4))*cos(x(4))*x(3)^2)/((c+b-c*cos(x(4)))) - ((c+b)*sin(x(4)))*g/((c+b-c*cos(x(4))));
   x(3) ];

B=[e/(c+b-c*(cos(x(4)))^2);
    0;
    -e*cos(x(4))/(d*(c+b-c*cos(x(4))))
    0];

dx=A+B*u(5);

