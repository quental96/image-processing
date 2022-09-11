%utilité de imagesc

clear all
close all

A=imread('lena.bmp'); %uint8 

B=zeros(size(A)); %codé en double
B(250:370,240:350)=300; %boucles interprétées pour parcours sur les indices

%C=A+B; %erreur car pas codé de la même facon, pas même format, il faut harmoniser les formats

C = double(A) + B;

%image(C) %sature à 255 -> au dessus de 255 c'est blanc ie coupé

imagesc(C) %réajuste l'échelle -> ramène le max à 255 => pb : écrase la dynamique de l'image, tout est plus sombre
colormap(gray(256))
