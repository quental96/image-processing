function P = baryCoin(D,hG,hD,bG,bD)

%Summary
%Description

sx=0;
sy=0;
k=0;

for i=hG(2):bG(2)
    for j=hG(1):hD(1)
        if D(i,j)>0
            sx=sx+i;
            sy=sy+j;
            k=k+1;
        end
    end
end

mx=sx/k;
my=sy/k;

P=[mx my];

end

