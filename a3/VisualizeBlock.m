close all;
clear all;

I = imread('street.jpg');
I = im2double(I);
img = I(481:512,481:512)

IMG = fft2(img);

subplot(1,2,1), bar3(abs(IMG),'w');
title('Original Fk bar graph');

IMG_new = fft2(img);
IMG_new(1,1) = 0;
subplot(1,2,2), bar3(abs(IMG_new),'w');
title('F0 zero-out bar graph');
