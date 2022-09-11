clear all
close all

u0r=0.05;
v0r=0.1;
Mmax=128;

[M,N]=meshgrid(0:Mmax-1);
s=cos(2*pi*u0r*N+2*pi*v0r*M);

figure
%colormap(gray(256))

subplot(2,2,1), imagesc(s), 
subplot(2,2,2), surf(s)

S=fft2(s);
u=linspace(-1/2,1/2-1/Mmax,Mmax);
v=linspace(-1/2,1/2-1/Mmax,Mmax);

subplot(2,2,3), imagesc(u,v,abs(fftshift(S)))
subplot(2,2,4), surf(u,v,abs(fftshift(S)))
