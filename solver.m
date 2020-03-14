function [U1,U2,x,t] = solver(N,c,eps,tf,c0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
H = 1;
L = 10;
g = 9.61;
dx = L/N;
dt = 0.5*c*dx;
Nt = round(tf/dt);
alpha = c0*dx/dt;
w = 0.4;

U1 = zeros(Nt,N);
U2 = zeros(Nt,N);
f1 = zeros(N+1,1);
f2 = zeros(N+1,1);
u1 = zeros(N+2,1);
u2 = zeros(N+2,1);
x = linspace(dx/2,L-dx/2,N);
t = linspace(0,tf,Nt);
U1(1,:) = H + eps*exp(-(x-L/2).^2/w^2);
U2(1,:) = 0;

for m = 2:Nt
    u1(2:N+1) = U1(m-1,:);
    
    u1(1) = U1(m-1,1);
    u1(N+2) = U1(m-1,end);
    if m==2
        u1
    end
    
    u2(2:N+1) = U2(m-1,:);
    u2(1) = -U2(m-1,1);
    u2(N+2) = -U2(m-1,end);
    f1 = F1(u1,u2,alpha);
    f2 = F2(u1,u2,alpha);
    U1(m,:)= U1(m-1,:) - dt/dx*(f1(2:end)'-f1(1:end-1)');
    U2(m,:)= U2(m-1,:) - dt/dx*(f2(2:end)'-f2(1:end-1)');   
end


end 

