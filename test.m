clear all
close all

N = 1000;
c = 0.1;
eps = 0.5;
tf = 3;
c0 = 0.8;

[U1,U2,x,t] = solver(N,c,eps,tf,c0);
[X,T] = meshgrid(x,t);
surf(T,X,U1,'EdgeColor','none')



