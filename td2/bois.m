clear all 
close all 

A=imread('trame.bmp'); 

figure
%colormap(gray(256))

subplot(2,2,1), image(A) 

[h,w]=size(A); 
B=log10(abs(fft2(A))); 

fx=linspace(0,1-1/w,w); 
fy=linspace(0,1-1/h,h); 

subplot(2,2,2), imagesc(fx,fy,B); 

% w et h pairs 

fx=linspace(-0.5,0.5-1/w,w); 
fy=linspace(-0.5,0.5-1/h,h); 
subplot(2,2,3), imagesc(fx,fy,fftshift(B)); 