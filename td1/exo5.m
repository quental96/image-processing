%difference image et imagesc

clear all 
close all 
A=imread('lena.bmp'); 

figure 
image(A) %entrée en uint8
colormap(gray(16)) %palette limitée à 16 niveaux sans scale
colorbar 
%tout ce qui est au dessus de 16 est saturé

figure 
imagesc(A) %imagesc new interprétation de la dynamique avec scale
colormap(gray(16)) 
colorbar 

B=imread('lezard.bmp'); 
figure
imagesc(B, [0 80])  %toute la dynamique de l'image mais restreinte entre 0 et 80, on sature le reste
colormap(gray(256)) 
colorbar 

 