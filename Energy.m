function [u1T, u2T, E1, E2] = Energy(U1,U2,x)
  g = 9.61;
  H = 1.0;
  dx = x(2) - x(1);
  [Nt, N] = size(U1);
  u1T = sum(((U1-H)),2);
  u2T = sum(U2,2);
  E1 = trapz(x,U1.^2,2) + 0.5*dx*U1(:,1).^2 + 0.5*dx*U1(:,end).^2;
  E2 = trapz(x,U2.^2,2)+ 0.5*dx*U2(:,1).^2 + 0.5*dx*U2(:,end).^2 ;
end
