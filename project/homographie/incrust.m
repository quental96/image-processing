% On stocke les coordonnees des coins de l'image a incruster

function [x_max,y_max,P] = incrust(A) % Prenant en argument le double de la photo

% Les coordonnees des coins sont fonction de la taille de l'image

x_max = length(A(1,:));
y_max = length(A(:,1));
P = [[1,1];[x_max,1];[x_max,y_max];[1,y_max]];

end

