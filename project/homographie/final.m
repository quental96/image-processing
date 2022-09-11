clear
clc
close all

v = VideoReader('vid_in2.mp4');
ImRGB=readFrame(v);
ImYCbCr=rgb2ycbcr(ImRGB);
I=double(ImYCbCr(:,:,1));


imshow(ImRGB);
[x,y] = getpts;
P1=[x,y];
[x,y] = getpts;
P2=[x,y];
[x,y] = getpts;
P3=[x,y];
[x,y] = getpts;
P4=[x,y];