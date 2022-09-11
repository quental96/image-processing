clear all 
close all 

A=imread('lena.bmp'); 

figure 
image(A);
colormap(gray(256)) 
axis('equal') 

figure
imhist(A)

B=double(A(:));
freq=histcounts(B,256);
prob=freq/length(B);

figure
bar(prob)