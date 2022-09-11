clear all
close all

A=imread('Cellule.jpg');
YCbCr_home=rgb2ycbcr(A);
Y=double(YCbCr_home(:,:,1));

BW=edge(Y,'canny',[0.1 0.5],3);

figure
imshow(BW)

[BWlabel,count]=bwlabel(BW,8);

figure
imshow(uint8(BWlabel),jet(count))

barycentre=zeros(2,count);

for i=1:count
    newBW=(BWlabel==i);
    [y,x]=find(newBW);
    barycentre(1,i)=mean(x);
    barycentre(2,i)=mean(y);
end

figure
imshow(A)
line(barycentre(1,:),barycentre(2,:),'linestyle','none','marker','+')

Y=Y./max(Y(:));
barycentre_selec=[];
for i=1:count-1
    Moy_bar=mean2(Y(fix(barycentre(2,i))+[-5,5],fix(barycentre(1,i))+[-5,5]));
    if Moy_bar<0.65
        barycentre_selec=[barycentre_selec barycentre(:,i)];
    end  
end

line(barycentre_selec(1,:),barycentre_selec(2,:),'linestyle','none','marker','o')