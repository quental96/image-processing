% Creation de la video finale

clear
clc
close all

tic


newV = VideoWriter('video.avi');
newV.FrameRate = 25;
open(newV);

Vid = VideoReader('vid_in2.mp4');
ImRGB=readFrame(Vid);
nI1=reshape(double(ImRGB(:,:,1)),1,[]);
nI2=reshape(double(ImRGB(:,:,2)),1,[]);
nI3=reshape(double(ImRGB(:,:,3)),1,[]);
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
[x,y] = getpts;
P5=[x,y];
[x,y] = getpts;
P6=[x,y];


k=0;

while hasFrame(Vid)
    
    [hG1,hD1,bG1,bD1] = zoneCoin(P1,25);
    [hG2,hD2,bG2,bD2] = zoneCoin(P2,25);
    [hG3,hD3,bG3,bD3] = zoneCoin(P3,25);
    [hG4,hD4,bG4,bD4] = zoneCoin(P4,25);
    [hG5,hD5,bG5,bD5] = zoneCoin(P5,25);
    [hG6,hD6,bG6,bD6] = zoneCoin(P6,25);
    
    [Ix,Iy]=intensityGradient(I,2);

    D1=harrisDetect(Ix,Iy,0.05,3);
    D2=harrisDetect(Ix,Iy,0.05,5);

    A1=D1>0;
    A2=D2>0;

    D=A1.*A2.*D1.*D2;
    
    P1 = maxCoin(D,hG1,hD1,bG1,bD1);
    P2 = maxCoin(D,hG2,hD2,bG2,bD2);
    P3 = maxCoin(D,hG3,hD3,bG3,bD3);
    P4 = maxCoin(D,hG4,hD4,bG4,bD4);
    P5 = maxCoin(D,hG5,hD5,bG5,bD5);
    P6 = maxCoin(D,hG6,hD6,bG6,bD6);
    
    
    k=k+1
    
    A = double(imread('cameraman.tif'));

    [x_max,y_max,P] = infoImage(A);
    H = homographie(P,P1,P2,P3,P4);


    x = min([P1(1) P2(1) P3(1) P4(1)]):max([P1(1) P2(1) P3(1) P4(1)]);
    y = min([P1(2) P2(2) P3(2) P4(2)]):max([P1(2) P2(2) P3(2) P4(2)]);

    I1=reshape(double(ImRGB(y,x,1)),1,[]);
    I2=reshape(double(ImRGB(y,x,2)),1,[]);
    I3=reshape(double(ImRGB(y,x,3)),1,[]);


    n=length(x);
    m=length(y);

    [X,Y]=meshgrid(x,y);

    vY=reshape(Y,1,m*n);
    vX=reshape(X,1,m*n);
    vI=ones(1,m*n);

    U=[vX;vY;vI];
    V=H*U;
    VN=[V(1,:)./V(3,:);V(2,:)./V(3,:)];


    t=(VN(1,:)>=1).*(VN(1,:)<x_max).*(VN(2,:)>=1).*(VN(2,:)<y_max);
    tM=(VN(1,:)<=x_max).*(VN(1,:)>=3*x_max/4).*(VN(2,:)>=y_max/4).*(VN(2,:)<=3*y_max/4);
    tI=(I1>=87).*(I1<=135).*(I2>=117).*(I3>117);

    s1=t+tM;
    s2=t+tM+tI;

    ind1=find(s1==1);
    ind2=find(s2==3);


    U1=U(:,ind1);
    U2=U(:,ind2);
    VN1=VN(:,ind1);
    VN2=VN(:,ind2);


    nI1(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);
    nI2(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);
    nI3(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);
    
    nI1(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);
    nI2(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);
    nI3(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);


    nI1=reshape(nI1,1080,1920);
    nI2=reshape(nI2,1080,1920);
    nI3=reshape(nI3,1080,1920);

    nImRGB=cat(3,nI1,nI2,nI3);
    
    
    [P,M] = projection(P1,P2,P3,P4,P5,P6);

    S0 = conv2Dnorm([0.375;0.375;3;1],P);
    S1 = conv2Dnorm([0;0.5;0;1],P);
    S2 = conv2Dnorm([0.375;0;0;1],P);
    S3 = conv2Dnorm([0.75;0.5;0;1],P);
    S4 = conv2Dnorm([0.375;1;0;1],P);

    nImRGB = insertPyr(nImRGB, S0,S1,S2,S3,S4);

    
    writeVideo(newV, uint8(nImRGB));
    
    ImRGB=readFrame(Vid);
    nI1=reshape(double(ImRGB(:,:,1)),1,[]);
    nI2=reshape(double(ImRGB(:,:,2)),1,[]);
    nI3=reshape(double(ImRGB(:,:,3)),1,[]);
    ImYCbCr=rgb2ycbcr(ImRGB);
    I=double(ImYCbCr(:,:,1));
    
end