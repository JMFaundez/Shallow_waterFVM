clear all
close all

N = 500;
c = 0.2;
eps = 0.1;
tf = 3;
c0 = 0.5;

[U1,U2,x,t] = solver(N,c,eps,tf,c0);
[X,T] = meshgrid(x,t);
figure(2000)
surf(T,X,U1,'EdgeColor','none')
colorbar()


figure(2001)
surf(T,X,U2./U1,'EdgeColor','none')
colorbar()
%view(2)
