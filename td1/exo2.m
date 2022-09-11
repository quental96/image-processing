%contenus indexés
%il faut donner palettes de couleurs pour vrai rendu visuel

clear
close all

A=imread('lena.bmp');

figure
image(A)
colormap(rand(256,3)) %palettes de nuances de gris
colorbar %affiche la colorbar