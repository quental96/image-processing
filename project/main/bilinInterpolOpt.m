function newint = bilinInterpolOpt(x,y,x_max,y_max,A)

% Summary : Interpolation bilineaire des coordonnees d'une image
% Description

B=reshape(A,1,[]);

X = floor(x);
Y = floor(y);

a = x-X;
b = y-Y;

newint = b.*(1-a).*B((min(X,x_max)-1)*y_max + min(Y+1,y_max)) + b.*a.*B((min(X+1,x_max)-1)*y_max+min(Y+1,y_max)) + (1-b).*(1-a).*B((min(X,x_max)-1)*y_max+min(Y,y_max)) + a.*(1-b).*B((min(X+1,x_max)-1)*y_max+min(Y,y_max));

end