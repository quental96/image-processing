%difference image et imagesc

clear all 
close all 
A=imread('lena.bmp'); 

figure 
image(A) %entr�e en uint8
colormap(gray(16)) %palette limit�e � 16 niveaux sans scale
colorbar 
%tout ce qui est au dessus de 16 est satur�

figure 
imagesc(A) %imagesc new interpr�tation de la dynamique avec scale
colormap(gray(16)) 
colorbar 

B=imread('lezard.bmp'); 
figure
imagesc(B, [0 80])  %toute la dynamique de l'image mais restreinte entre 0 et 80, on sature le reste
colormap(gray(256)) 
colorbar 

 