clear
close all

tic


v = VideoReader('vid_in2.mp4');
ImRGB=readFrame(v);
ImYCbCr=rgb2ycbcr(ImRGB);
I=double(ImYCbCr(:,:,1));


[Ix,Iy]=intensityGradient(I,2);

D1=harrisDetect(Ix,Iy,0.05,3);
D2=harrisDetect(Ix,Iy,0.05,5);

A1=D1>0;
A2=D2>0;

D=A1.*A2.*D1.*D2;


toc

figure

subplot(3,1,1)
imshow(0.5+Ix*0.3)

subplot(3,1,2)
imshow(0.5+Iy*0.3)

subplot(3,1,3)
imshow(D)
