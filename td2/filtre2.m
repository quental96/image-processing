clear all, close all 

A=double(imread('couloir.tif')); 

figure
imshow(uint8(A)) 

[h,w]=size(A); 
fx=linspace(-0.5,0.5-1/w,w); 
fy=linspace(-0.5,0.5-1/h,h); 
IfA=fftshift(log10(abs(fft2(A)))); 

figure
imagesc(fx,fy,IfA) 

H1=ones(5)/25; 
B=conv2(A,H1,'same'); 

figure
imshow(uint8(B)); 

IfB=fftshift(log10(abs(fft2(B)))); 
figure
imagesc(fx,fy,IfB) 

C=medfilt2(A, [5 5]); 

figure
imshow(uint8(C)); 

IfC=fftshift(log10(abs(fft2(C)))); 
figure
imagesc(fx,fy,IfC) 