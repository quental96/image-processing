%vraies couleurs

clear
close all

A=imread('pool.tiff');
whos %donne les infos de l'image (name, size, bytes, class)

figure
image(A)
