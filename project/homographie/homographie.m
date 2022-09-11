% On determine la transformation pour incruster l'image

function H = homographie(P, P1, P2, P3, P4) % Prenant en argument les points detectes

% Les coordonnees des coins initiaux sont fonctions de la taille de l'image

D = [P1;P2;P3;P4];

A = zeros(8);

for i = 1:4
    
    A(i,:) = [D(i,1) D(i,2) 1 0 0 0 -D(i,1)*P(i,1) -D(i,2)*P(i,1)];
    A(i+4,:) = [0 0 0 D(i,1) D(i,2) 1 -D(i,1)*P(i,2) -D(i,2)*P(i,2)];

end

B = [P(:,1);P(:,2)];
X = A\B;
H = [[X(1),X(2),X(3)];[X(4),X(5),X(6)];[X(7),X(8),1]];

end