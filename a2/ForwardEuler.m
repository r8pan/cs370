function [y] = ForwardEuler(t_0, t_final, N, y_0)
%scripts for Forward Euler

h = (t_final - t_0)/N;
t = t_0;
y = zeros(N+1,1);
y(1,1) = y_0;
for i = 2: N+1
  y(i,1) = y(i-1,1) + h*Dynamics(t, y(i-1,1));
  t = t + h;
end
