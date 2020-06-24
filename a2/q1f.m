clear all;
close all;

x = [0:8/25:8];
x
y_approx = RK2(0,8,25,1);
y = 0.5.*cos(x.*2).*exp(x./2)+x.*4.+0.5;

plot(x,y,'.-');
hold on;
plot(x,y_approx,'+');
hold off;
title('Q1f');
