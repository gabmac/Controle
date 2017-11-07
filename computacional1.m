clear all;
close all;
clc;


%valores de cada variavel
m = 1;
b = 1.725;
k = 0.575;
j = 0.15;
l = 1;
L = 2;

%valores para funcao transferencia
M = m*l^2+j;
C = b*l^2;
K = k*l^2;

s = tf('s');

G = L/(M*s^2+C*s+K);


%valores advindos do step
A1 = pi*K/(L*9);

A2 = pi*K/(L*3);

step(A1*G);
hold on;
step(A2*G);


%valor do Wn
Wn = ((k*l^2)/M)^0.5;

doisWncsi = C/M;


csi = doisWncsi/(2*Wn);

%tempo de estabilização
te = 4/(doisWncsi/2);

