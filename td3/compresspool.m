clear all
close all

A=imread('pool.tif');

imwrite(A,'pool90.jpg','quality',90);
imwrite(A,'pool10.jpg','quality',10);

S=imfinfo('pool.tif');
poolsize=S.FileSize;

S=imfinfo('pool90.jpg');
pool90size=S.FileSize;

S=imfinfo('pool10.jpg');
pool10size=S.FileSize;

figure
imshow(A)

figure
imshow(imread('pool90.jpg'))

figure
imshow(imread('pool10.jpg'))

R90=poolsize/pool90size
R10=poolsize/pool10size