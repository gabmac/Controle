close all;
clear all;
clc;

global a b c d e g

a = 5.4;
b = 1.0731;
c = 0.209;
d = 0.3302;
e = 1.0717;
g = 9.81;

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
[N,D] = ss2tf(A,B,C,0);

G = tf(N,D);

s = tf('s');

%sisotool(G);

C = 3.1463/(1+0.41*s);

[Nc,Dc]=tfdata(C,'v')

C = tf(Nc,Dc);
F = feedback(G*C,1);

%sim('SIMUL',[0,20]);

H = c2d(C,0.2,'zoh');

[NCzoht1,DCzoht1] = tfdata(H,'v');

H = c2d(C,0.5,'zoh');

[NCzoht2,DCzoht2] = tfdata(H,'v');

H = c2d(C,1,'zoh');

[NCzoht3,DCzoht3] = tfdata(H,'v');

H = c2d(C,0.2,'tustin');

[NCtust1,DCtust1] = tfdata(H,'v');

H = c2d(C,0.5,'tustin');

[NCtust2,DCtust2] = tfdata(H,'v');

H = c2d(C,1,'tustin');

[NCtust3,DCtust3] = tfdata(H,'v');

H = c2d(C,0.2,'matched');

[NCmact1,DCmact1] = tfdata(H,'v');

H = c2d(C,0.5,'matched');

[NCmact2,DCmact2] = tfdata(H,'v');

H = c2d(C,1,'matched');

[NCmact3,DCmact3] = tfdata(H,'v');

Gd = c2d(G,1.0,'zoh');

K = 2.4588;
 
Cd = tf(K);

[Ncd,Dcd]=tfdata(Cd,'v');
