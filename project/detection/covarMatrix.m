function T = covarMatrix(Gradx,Grady,sigma)

%Summary
%Description

N = ceil(3*sigma);
[x,y]=meshgrid(-N:N);

G=exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma*sigma); 

A=Gradx.^2;
B=Gradx.*Grady;
C=Grady.^2;

T=cell(2,2);

T{1,1}=conv2(A, G, 'same');
T{1,2}=conv2(B, G, 'same');
T{2,1}=T{1,2};
T{2,2}=conv2(C, G, 'same');

end

