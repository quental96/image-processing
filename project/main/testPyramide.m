clear
clc
close all

tic

v = VideoReader('vid_in2.mp4');
% ImRGB=readFrame(v);
ImRGB=read(v,215);
ImYCbCr = rgb2ycbcr(ImRGB);
I = double(ImYCbCr(:,:,1));

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

[P,M] = projection(P1,P2,P3,P4,P5,P6);

S0 = conv2Dnorm([0.375;0.375;7;1],P);
S1 = conv2Dnorm([0;0.5;0;1],P);
S2 = conv2Dnorm([0.375;0;0;1],P);
S3 = conv2Dnorm([0.75;0.5;0;1],P);
S4 = conv2Dnorm([0.375;1;0;1],P);

ImRGB = insertPyr(ImRGB, S0,S1,S2,S3,S4);

toc

imshow(ImRGB)