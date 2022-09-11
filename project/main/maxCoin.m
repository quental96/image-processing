function Pmax = maxCoin(D,hG,hD,bG,bD)

% Summary : Recherche d'un maximum dans une zone restreinte d'une matrice
%
% Description : On prend en arguments les quatre coins d'un rectangle/carre
% et on recherche le maximum de ce quadrilatere au sein d'une matrice D. 

Imax=0;

for i=hG(2):bG(2)
    for j=hG(1):hD(1)
        if D(i,j)>Imax
            imax=i;
            jmax=j;
            Imax=D(i,j);
        end
    end
end

Pmax=[jmax imax];

end
