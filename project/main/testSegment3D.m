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
[x,y] = getpts;
P5=[floor(x),floor(y)];
[x,y] = getpts;
P6=[floor(x),floor(y)];


tic


[P,M] = projection(P1,P2,P3,P4,P5,P6);

% Deux extremités du segment en coordonnees 3D
v1=[0.5;0.5;5;1];
v2=[0.5;0.5;0;1];

% Application de la projection
s1=P*v1;
s1=s1(1:2)/s1(3);
s2=P*v2;
s2=s2(1:2)/s2(3);

% Insertion du segment
ImRGB=insertSegment(s1,s2,ImRGB);


toc


figure
imshow(ImRGB)