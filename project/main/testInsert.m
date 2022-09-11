% Test de l'insertion d'une image

clear
clc
close all




v = VideoReader('vid_in2.mp4');
% ImRGB=readFrame(v);
ImRGB=read(v,100);

imshow(ImRGB);
[x,y] = getpts;
P1=[floor(x),floor(y)];
[x,y] = getpts;
P2=[floor(x),floor(y)];
[x,y] = getpts;
P3=[floor(x),floor(y)];
[x,y] = getpts;
P4=[floor(x),floor(y)];


tic 

A = double(imread('cameraman.tif'));

[x_max,y_max,P] = infoImage(A);
H = homographie(P,P1,P2,P3,P4);

M=masque(A);

for i = min([P1(2) P2(2) P3(2) P4(2)]):max([P1(2) P2(2) P3(2) P4(2)])
    for j = min([P1(1) P2(1) P3(1) P4(1)]):max([P1(1) P2(1) P3(1) P4(1)])
        
        u = [j;i;1];
        v = H*u;
        vN = v(1:2)/v(3);
        
        r = remplaceImage(i,j,x_max,y_max,M,vN,A,ImRGB);
        ImRGB(i,j,1)=r(1);
        ImRGB(i,j,2)=r(2);
        ImRGB(i,j,3)=r(3);
        
    end
end


toc

figure
imshow(ImRGB);


        
