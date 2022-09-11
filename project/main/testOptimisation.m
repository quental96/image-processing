% Test de l'optimisation pour une insertion

clear
clc
close all



v = VideoReader('vid_in2.mp4');
ImRGB=read(v,100);

% On vectorise la frame
nI1=reshape(double(ImRGB(:,:,1)),1,[]);
nI2=reshape(double(ImRGB(:,:,2)),1,[]);
nI3=reshape(double(ImRGB(:,:,3)),1,[]);


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

% Zone autour de la feuille
x = min([P1(1) P2(1) P3(1) P4(1)]):max([P1(1) P2(1) P3(1) P4(1)]);
y = min([P1(2) P2(2) P3(2) P4(2)]):max([P1(2) P2(2) P3(2) P4(2)]);

I1=reshape(double(ImRGB(y,x,1)),1,[]);
I2=reshape(double(ImRGB(y,x,2)),1,[]);
I3=reshape(double(ImRGB(y,x,3)),1,[]);

% Ici on place tout les pixels de la zone dans une matrice U auquelle on
% applique l'homographie. Tout les pixels homographies se trouvent donc
% dans VN.
n=length(x);
m=length(y);

[X,Y]=meshgrid(x,y);

vY=reshape(Y,1,m*n);
vX=reshape(X,1,m*n);
vI=ones(1,m*n);

U=[vX;vY;vI];
V=H*U;
VN=[V(1,:)./V(3,:);V(2,:)./V(3,:)];

% Test pour savoir si on doit inserer ou non l'image
t=(VN(1,:)>=1).*(VN(1,:)<x_max).*(VN(2,:)>=1).*(VN(2,:)<y_max);
% Masque faisant le tour de la main
tM=(VN(1,:)<=x_max).*(VN(1,:)>=3*x_max/4).*(VN(2,:)>=y_max/4).*(VN(2,:)<=3*y_max/4);
% Filtrage de la main
tI=(I1>=87).*(I1<=135).*(I2>=117).*(I3>117);

s1=t+tM; 
s2=t+tM+tI;

ind1=find(s1==1); % La condition t est validee mais pas tM
ind2=find(s2==3); % Les conditions t, tM et tI sont validees

% On ne garde que les positions qui nous interesse, ie les positions ou
% l'on va inserer l'image
U1=U(:,ind1);
U2=U(:,ind2);
VN1=VN(:,ind1);
VN2=VN(:,ind2);

% Insertion de l'image
nI1(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);
nI2(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);
nI3(floor((U1(1,:)-1)*1080+U1(2,:)))=bilinInterpolOpt(VN1(1,:),VN1(2,:),x_max,y_max,A);

nI1(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);
nI2(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);
nI3(floor((U2(1,:)-1)*1080+U2(2,:)))=bilinInterpolOpt(VN2(1,:),VN2(2,:),x_max,y_max,A);

% On recree une image non vectorise
nI1=reshape(nI1,1080,1920);
nI2=reshape(nI2,1080,1920);
nI3=reshape(nI3,1080,1920);
nImRGB=cat(3,nI1,nI2,nI3);


toc


figure

imshow(uint8(nImRGB))
