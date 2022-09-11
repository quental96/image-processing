close all
clear all

A=imread('robot.bmp'); 
%A=double(imread('robot.bmp'));

figure 
image(A);
colormap(gray(256)) 
axis('equal') 

figure
imhist(A)

Iemax=max(A(:));
Iemin=min(A(:));

B=(255/(Iemax-Iemin)).*(A-Iemin);

figure 
image(B);
%imshow(uint8(B))
colormap(gray(256)) 
axis('equal')

figure
imhist(B)