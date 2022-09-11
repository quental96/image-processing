function [Gradx,Grady] = intensityGradient(I,sigma)

%Summary
%Description

N = ceil(3*sigma);
[x,y] = meshgrid(-N:N);

Gx = -x .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4);
Gy = -y .* exp(-(x.^2+y.^2)/(2*sigma^2)) / (2*pi*sigma^4); 

Gradx = conv2(I, Gx, 'same');
Grady = conv2(I, Gy, 'same');

end

