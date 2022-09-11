%synthèse meshgrid

clear all 
close all 

[X,Y]=meshgrid(-32:32,-32:32); %création de matrices à partir de vecteurs X et Y (axes et couples de (x,y))
R=(X.^2+Y.^2).^0.5; %rayon

img=1000*sin(R/2)./R; %fonction que l'on va visualiser

figure
imagesc(img) %visualisation bidimensionnelle
axis square 

figure
surf(img) %visualisation 3D