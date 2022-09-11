%utilit� de imagesc

clear all
close all

A=imread('lena.bmp'); %uint8 

B=zeros(size(A)); %cod� en double
B(250:370,240:350)=300; %boucles interpr�t�es pour parcours sur les indices

%C=A+B; %erreur car pas cod� de la m�me facon, pas m�me format, il faut harmoniser les formats

C = double(A) + B;

%image(C) %sature � 255 -> au dessus de 255 c'est blanc ie coup�

imagesc(C) %r�ajuste l'�chelle -> ram�ne le max � 255 => pb : �crase la dynamique de l'image, tout est plus sombre
colormap(gray(256))
