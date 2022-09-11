function D = harrisDetect(Gradx,Grady,k,sigma)

%Summary
%Description

N = ceil(3*sigma);
[x,y]=meshgrid(-N:N);

G=exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma*sigma); 

A=Gradx.^2;
B=Gradx.*Grady;
C=Grady.^2;

a=conv2(A, G, 'same');
b=conv2(B, G, 'same');
c=conv2(C, G, 'same');

D=a.*c-b.^2-k*(a+c).^2;

end

