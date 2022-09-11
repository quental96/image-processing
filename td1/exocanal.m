%afficher les différents canaux d'une image

clear all
close all

A= imread('pool.tiff');

r = A(:,:,1); %canal rouge
g = A(:,:,2); %canal vert
b = A(:,:,3); %canal bleu

figure

subplot(2,2,1)
imshow(A)
title ('image origine')

subplot(2,2,2)
imshow(r) %pas besoin de palettes avec imshow
title('canal rouge')
%quand le rouge sature -> blanc
%quand pas de rouge -> noir

subplot(2,2,3)
imshow(g)
title('canal vert')

subplot(2,2,4)
imshow(b)
title('canal bleu')


