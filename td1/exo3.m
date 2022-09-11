clear
close all

%on crée une image 

r=[1 0 1;0 0 0;1 0 1]; %canal rouge
g=[0 1 0;1 0 1;0 1 0]; %canal vert
b=[0 0 0;0 1 0;0 0 0]; %canal bleu

img=cat(3,r,g,b); %on concatène les 3 canaux

figure
imagesc(img)

%il n'y a pas de relation entre le taille de l'image que je veux créer et
%la figure renvoyé => il y a changement d'échelle réalisé automatiquement
%par matlab

%il existe différentes fonctions pour visualiser des images: image,
%imagesc, imshow (garde l'échelle)