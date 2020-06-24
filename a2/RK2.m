function [y] = RK2(t_0, t_final, N, y_0)
%function for second order Runge Kutta scheme

h = (t_final - t_0)/N;
t = t_0;
y = zeros(N+1,0);
y(1,1) = y_0;

for i = 2:N+1
  k_1 = Dynamics(t,y(i-1,1));
  k_2 = Dynamics(t+h*2/3,y(i-1,1)+2*h*k_1/3);
  y(i,1) = y(i-1,1) + h*(k_1/4 + k_2*3/4);
  t = t + h;
end
