function M = masque(A)

% Summary : Creation d'un masque d'image
% Description

[x_max,y_max,P] = infoImage(A);

M=zeros(x_max,y_max);

for i=1:y_max
    for j=1:x_max
        if (j>=3*x_max/4) && (i>=y_max/4) && (i<=3*y_max/4)
            M(i,j)=1;
        end
    end
end

end

