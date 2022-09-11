function [hG,hD,bG,bD] = zoneCoin(P,delta)

% Summary : On determine un carre centre autour d'un point
%
% Description : On donne les quatre coins d'un carre centre autour d'un
% point P. La taille du carre est de 2*delta.

R1=round(P(1));
R2=round(P(2));

hG = [R1-delta  R2-delta];
hD = [R1+delta  R2-delta];
bG = [R1-delta  R2+delta];
bD = [R1+delta  R2+delta];

end

