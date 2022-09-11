function Pmax = maxCoin(D,hG,hD,bG,bD)

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
