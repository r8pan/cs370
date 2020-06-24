close all;
clear all;

X = imread('street.jpg');
Xp = im2double(X);
compression = figure;
error = figure;
bg = ones(512,512);

[Y_10, drop] = Compress(X,0.00026);
figure(compression);
subplot(2,2,1), imshow(Y_10);
title('tol = 0.00026, drop = 0.1014');
figure(error);
err_10 = bg - abs(Xp-Y_10);
subplot(2,2,1), imshow(err_10);
title('error image for drop = 0.10');

[Y_50, drop] = Compress(X,0.0035);
figure(compression);
subplot(2,2,2), imshow(Y_50);
title('tol = 0.0035, drop = 0.4970');
figure(error);
err_50 = bg - abs(Xp-Y_50);
subplot(2,2,2), imshow(err_50);
title('error image for drop = 0.50');


[Y_85, drop] = Compress(X,0.014);
figure(compression);
subplot(2,2,3), imshow(Y_85);
title('tol = 0.014, drop = 0.8459');
figure(error);
err_85 = bg - abs(Xp-Y_85);
subplot(2,2,3), imshow(err_85);
title('error image for drop = 0.85');


[Y_95, drop] = Compress(X,0.032);
figure(compression);
subplot(2,2,4), imshow(Y_95);
title('tol = 0.032, drop = 0.9493');
figure(error);
err_95 = bg - abs(Xp-Y_95);
subplot(2,2,4), imshow(err_95);
title('error image for drop = 0.95');

