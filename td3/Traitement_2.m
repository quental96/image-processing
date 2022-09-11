%% Stylisation d'une image
clear
close all

img = imread('Ressources/home.jpg');
img_ycbcr = rgb2ycbcr(img);

Y = double(img_ycbcr(:,:,1));


% Filtre de Canny
sigma = 2;
N = 3*sigma;
[x,y] = meshgrid(-N:N);
Gx = -x .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4);
Gy = -y .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4); %Gx';

Gradx = conv2(Y, Gx, 'same');
Grady = conv2(Y, Gy, 'same');

mod_grad = sqrt(Gradx.^2 + Grady.^2);
C = mod_grad/max(mod_grad(:));
Ymod = (255-30)*(1-C);
img_ycbcr(:,:,1)= uint8(Ymod);
RGBmod = ycbcr2rgb(img_ycbcr);


figure('units','normalized','outerposition',[0 0 1 1])

subplot(1,3,1)
imshow(uint8(img))
title('Image')

subplot(1,3,2)
imshow(C)
title('Module du gradient de la luminance')

subplot(1,3,3)
imshow(RGBmod);
title('Image stylisée')

%% Cellules souches
clear
close all

img = imread('Ressources/Cellule.jpg');
img_ycbcr = rgb2ycbcr(img);

Y = double(img_ycbcr(:,:,1));


% Filtre de Canny
sigma = 3;
N = 3*sigma;
[x,y] = meshgrid(-N:N);
Gx = -x .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4);
Gy = -y .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4); %Gx';

Gradx = convn(Y, Gx, 'same');
Grady = convn(Y, Gy, 'same');

mod_grad = sqrt(Gradx.^2 + Grady.^2);
C = mod_grad/max(mod_grad(:));


% Filtre de Canny par matlab, avec double seuil
tresh = [0.1 0.5];
BW = edge(Y,'canny',tresh,sigma);

[BWlabel,count]=bwlabel(BW,8);

barx = zeros(count);
bary = zeros(count);

for i=1:count
    CBW = (BWlabel == i);
    [y,x] = find(CBW);
    barx(i) = mean(x);
    bary(i) = mean(y); 
end

Taille = 3;
vois = -Taille:Taille;

barycentre_selec = [];

Y = Y/255;

for ii = 1:count-1
    Val = mean2(Y(fix(bary(ii))+vois,fix(barx(ii))+vois));
    if Val <0.63
        barycentre_selec = [barycentre_selec [barx(ii); bary(ii)]];
    end
end

% Affichage
figure('Name','1','units','normalized','outerposition',[0 0 1 1])

subplot(2,3,1)
imshow(uint8(img))
title('Image')

subplot(2,3,2)
imshow(C)
title('Module du gradient de la luminance')

subplot(2,3,3)
imshow(BW)
title('En utilisant ''edge''')

subplot(2,3,4)
imshow(BWlabel);
line(barx, bary, 'LineStyle','none','Marker','+','Color',[1 0 0]);
title('Affichage des barycentres')

subplot(2,3,5)
imshow(uint8(img))
line(barycentre_selec(1,:), barycentre_selec(2,:), 'LineStyle','none','Marker','+','Color',[1 0 0]);
