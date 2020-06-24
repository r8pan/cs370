function [dydt] = Dynamics(t, y)
%Scripts for q1b
  
dydt = 0.5*y - sin(2*t)*exp(t/2)- 2*t + 3.75;
return
