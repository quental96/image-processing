function [Gradx,Grady] = intensityGradient(I,sigma)

% Summary : On determine le gradient d'intensité d'une image
%
% Description : A l'aide d'un produit de convolution on determine le
% gradient d'intensité d'une image I. La convolution se fait grace aux
% derivees partielles d'une gaussienne Gx et Gy. On peut donc jouer sur le
% parametre sigma de la gaussienne.

N = ceil(3*sigma);
[x,y] = meshgrid(-N:N);

Gx = -x .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4);
Gy = -y .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4); 

Gradx = conv2(I, Gx, 'same');
Grady = conv2(I, Gy, 'same');

end

