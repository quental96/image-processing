clear
close all

%on cr�e une image 

r=[1 0 1;0 0 0;1 0 1]; %canal rouge
g=[0 1 0;1 0 1;0 1 0]; %canal vert
b=[0 0 0;0 1 0;0 0 0]; %canal bleu

img=cat(3,r,g,b); %on concat�ne les 3 canaux

figure
imagesc(img)

%il n'y a pas de relation entre le taille de l'image que je veux cr�er et
%la figure renvoy� => il y a changement d'�chelle r�alis� automatiquement
%par matlab

%il existe diff�rentes fonctions pour visualiser des images: image,
%imagesc, imshow (garde l'�chelle)