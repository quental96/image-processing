close all
clear all

A=double(imread('monument_ext.bmp')); 

figure
imshow(uint8(A));
colormap(gray(256)) 
axis('equal')

H1=ones(3)/9;
figure
freqz2(H1);
H2=ones(5)/25;
figure
freqz2(H2);
[X,Y]=meshgrid(-5:5);
sigma=1.5; 
H3=exp(-(X.^2+Y.^2)/(2*sigma^2))/(2*pi*sigma*sigma); 
figure
freqz2(H3);

B1=conv2(A,H1,'same');
B2=conv2(A,H2,'same');
B3=conv2(A,H3,'same');

figure
imshow(uint8(B1));
figure
imshow(uint8(B2));
figure
imshow(uint8(B3));

[h,w]=size(A); 
F=log10(abs(fft2(A))); 
fx=linspace(-0.5,0.5-1/w,w); 
fy=linspace(-0.5,0.5-1/h,h); 
figure
imagesc(fx,fy,fftshift(F));
