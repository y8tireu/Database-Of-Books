% Compute the value of the 1-D quadratic shape function and its first 
% derivative at a set of input points. 
% Input: start_x, mid_x, end_x: starting, middle and
%        ending points of the element
% Input: x_vector=[x1, x2, x3 ...]': a list of input positions where 
%        the shape function and its derivative should be evaluated. 
% Output: N, Nx: shape function and its x-derivative are stored in N 
%         and Nx, respectively, in the format shown as follows
%         N=[ N1(x1) N1(x2) N1(x3) ...
%             N2(x1) N2(x2) N2(x3) ...
%             N3(x1) N3(x2) N3(x3) ...]
%         Nx=[N'1(x1) N'1(x2) N'1(x3) ...
%             N'2(x1) N'2(x2) N'2(x3) ...
%             N'3(x1) N'3(x2) N'3(x3) ...]                         ]
function [N,Nx]=CompElementShapeQuadratic1D(start_x, mid_x, end_x, x_vector)
n=size(x_vector,1);                % obtain the size of x_vector
[N, Nx]= deal(zeros(3,n));         % setup empty N and Nx
for i=1:n                          % loop over each point x
  N(1,i)=(x_vector(i) - mid_x)*(x_vector(i) - end_x)...
         /((start_x - mid_x)*(start_x - end_x));          % N1(x)
  N(2,i)=(x_vector(i) - start_x)*(x_vector(i) - end_x)...
         /((mid_x - start_x)*(mid_x - end_x));            % N2(x)
  N(3,i)=(x_vector(i) - start_x)*(x_vector(i) - mid_x)...
         /((end_x - start_x)*(end_x - mid_x));            % N3(x)
  Nx(1,i)=(2*x_vector(i) - mid_x - end_x)...
         /((start_x - mid_x)*(start_x - end_x));          % N'1(x)
  Nx(2,i)=(2*x_vector(i) - start_x - end_x)...
         /((mid_x - start_x)*(mid_x - end_x));            % N'2(x)
  Nx(3,i)=(2*x_vector(i) - start_x - mid_x)...
         /((end_x - start_x)*(end_x - mid_x));            % N'3(x)
end