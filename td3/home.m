clear all
close all

A=imread('home.jpg');
YCbCr_home=rgb2ycbcr(A);
Y=double(YCbCr_home(:,:,1));

Gx=1/8*[1 0 -1; 2 0 -2; 1 0 -1];
Gy=Gx';
Gradx=conv2(Y,Gx,'same');
Grady=conv2(Y,Gy,'same');

mod_grad=sqrt(Gradx.^2+Grady.^2);

C=mod_grad/max(mod_grad(:));

Y=(255-30)*(1-C);
YCbCr_home(:,:,1)=Y;

RGB_home=ycbcr2rgb(YCbCr_home);

figure
imshow(A)

figure
imshow(RGB_home)