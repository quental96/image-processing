%imshow 

clear all
close all

A=imread('cameraman.tif'); %deja dans matloab 
figure 
imshow(A)

B=double(A);

%figure
%imshow(B)
%marche pas car il faut une palette en 256 avec imshow et ici on est en
%double

figure 
imshow(B/255) %il faut normaliser pour que ca marche avec imshow

%imshow r�agit diff�remment selon le format d'entr�e 
%uint8 -> OK
%double -> il faut normaliser