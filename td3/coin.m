clear all
close all

A=double(imread('coins.png'));

Gx=1/8*[1 0 -1; 2 0 -2; 1 0 -1];
Gy=Gx';
Gradx=conv2(A,Gx,'same');
Grady=conv2(A,Gy,'same');

mod_grad=sqrt(Gradx.^2+Grady.^2);

figure
imshow(uint8(A))

C=mod_grad/max(mod_grad(:));

figure
imshow(C)

Y=(255-30)*(1-C);

figure
imshow(uint8(Y))