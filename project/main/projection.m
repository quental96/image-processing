function [P,M] = projection(P1, P2, P3, P4, P5, P6)

% Summary : On determine la projection pour passer de l'espace 3D a
% l'espace 2D
%
% Description : On prend en argument les points detectes, les coordonnees 
% des coins initiaux sont fonction de la taille de l'image

M = [[0 0 0 1];[1 0 0 1];[1 1 0 1];[0 1 0 1];[0.5 0.5 0 1];[0.5 0.5 1 1]];
N = zeros(6,4);

B = [P1(1);P2(1);P3(1);P4(1);P5(1);P6(1);P1(2);P2(2);P3(2);P4(2);P5(2);P6(2)];

A = zeros(12,11);
A(1:6,1:4) = M;
A(7:12,5:8) = M;
A(1:6,5:8) = N;
A(7:12,1:4) = N;

for i = 1:6
    for j = 1:3
        A(i,j+8) = -M(i,j)*B(i);
        A(i+6,j+8) = -M(i,j)*B(i+6);        
    end
end

X = A\B;
P = [[X(1) X(2) X(3) X(4)];[X(5),X(6),X(7) X(8)];[X(9) X(10) X(11) 1]];

end