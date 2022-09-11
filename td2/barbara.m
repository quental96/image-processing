clear all 
close all 

A=imread('barbara.bmp'); 

figure 
image(A) 
colormap(gray(256)) 
axis('equal') 

figure 
image(A(1:80,140:280)) 
colormap(gray(256)) 
axis('equal') 

[Ny,Nx]=size(A); 
B=A(1:4:Ny,1:4:Nx); 

figure 
image(B) 
colormap(gray(256)) 
axis('equal') 

figure 
image(B(1:20,35:70)) 
colormap(gray(256)) 
axis('equal') 