clear
close all

tic

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


k=0;
while hasFrame(v)
    
    [hG1,hD1,bG1,bD1] = zoneCoin(P1,37);
    [hG2,hD2,bG2,bD2] = zoneCoin(P2,37);
    [hG3,hD3,bG3,bD3] = zoneCoin(P3,37);
    [hG4,hD4,bG4,bD4] = zoneCoin(P4,37);
    
    [Ix,Iy]=intensityGradient(I,2);

    D1=harrisDetect(Ix,Iy,0.05,3);
    D2=harrisDetect(Ix,Iy,0.05,5);

    A1=D1>0;
    A2=D2>0;

    D=A1.*A2.*D1.*D2;
    
    P1 = maxCoin(D,hG1,hD1,bG1,bD1)
    P2 = maxCoin(D,hG2,hD2,bG2,bD2);
    P3 = maxCoin(D,hG3,hD3,bG3,bD3);
    P4 = maxCoin(D,hG4,hD4,bG4,bD4);
    k=k+1
    
    ImRGB=readFrame(v);
    ImYCbCr=rgb2ycbcr(ImRGB);
    I=double(ImYCbCr(:,:,1));
    
end

toc