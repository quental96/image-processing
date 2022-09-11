function newint = bilinInterpol(x,y,A)

%Summary
%Description

X = floor(x);
Y = floor(y);

a = x-X;
b = y-Y;

newint = b*(1-a)*A(Y+1,X) + b*a*A(Y+1,X+1) + (1-b)*(1-a)*A(Y,X) + a*(1-b)*A(Y,X+1);

end