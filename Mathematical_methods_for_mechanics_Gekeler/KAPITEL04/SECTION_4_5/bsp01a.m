function Y = bsp01a(X,flag,Parmeter);
% Thrust Problem, Bryson_Ho, p. 59
% Non-analytic derivatives
% flag = 1: Objective function
% flag = 2: Inequalities, also []
% flag = 3: Equalities 
% flag = 4: Gradient of objective function
% flag = 5: Gradient of inequalities, also []
% flag = 6: Gradient of equalities
% -------------------------------------------
% !! Gradient of f: R_n -> R_m is (m,n)-matrix !!
% -------------------------------------------
hh = 1E-5; % increment for calculation of derivative
n = Parmeter(1); a = Parmeter(2); T_END = Parmeter(3);
H = Parmeter(4);
A = T_END/n;
D      = 0.5*ones(n+1,1);
E      = zeros(n+1,n+1) + tril(ones(n+1,n+1),-1) + diag(D);
E(:,1) = D; E(1,1) = 0; 
E      = A*sparse(E);
X1 = X(1:n+1); X2 = X(n+2:2*(n+1)); X3 = X(2*n+3:3*(n+1));
X4 = X(3*n+4:4*(n+1)); U  = X(4*n+5:5*(n+1));
GG = 1;
switch flag
case 1, Y = - X3(n+1);
case 2, Y = 0;
case 3
   Y = [X1 - E*X3; X2 - E*X4; X3 - a*E*cos(U);
        X4 - a*E*sin(U); X2(n+1) - H; X4(n+1)];
case 4, Y = derivative(@bsp01,X,1,hh,Parmeter);
case 5, Y = 0;
case 6, Y = derivative(@bsp01,X,3,hh,Parmeter);
        Y = sparse(Y);
end
