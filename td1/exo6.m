%différence image et imagesc

clear all 
close all 

A=double(imread('coronair.tiff')); %on convertit en double
figure 
subplot(2,2,1)
image(A)
title('originale')

BW=A>150; 
B=A.*not(BW)+ 500.*BW; %B = A sauf quand niveau de gris supérieur à 150 que je remplace par 500

subplot(2,2,2)
image(B) 
colormap(gray(256)) 
colorbar 
title('affichage avec image')

subplot(2,2,3)
imagesc(B) 
colormap(gray(256)) 
colorbar
title('affichage avec imagesc')
%ecrasement de la dynamique lié au changement d'échelle