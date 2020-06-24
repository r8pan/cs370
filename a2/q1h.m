clear all;
close all;

y4 = zeros(10,1);
y_4 = 15.96245;
ratio = zeros(9,1);

for i = 1:10
  rk2 = RK2(0,4,2^i*10,1);
  y4(i,1) = rk2(2^i*10,1);
end
y4
err = y4-y_4

for i = 2:10
  ratio(i-1,1) = err(i)/err(i-1);
end
ratio

