%synthèse additive
%il faut créer masque binaire de type cercle

%vraies couleurs
clear all
close all

size=255;
radius=50;
dist=45;

[R,G,B]=disks(size,radius,dist);

img=cat(3,R,G,B);

figure
imshow(img)

%couleurs indexées
[R,G,B]=disks(size,radius,dist);

img=uint8(R+2*G+4*B);
map=[0 0 0;1 0 0;0 1 0;1 1 0;0 0 1; 1 0 1; 0 1 1; 1 1 1];

figure
imshow(img,map)