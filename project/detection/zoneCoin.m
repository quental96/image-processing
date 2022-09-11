function [hG,hD,bG,bD] = zoneCoin(P,delta)

%Summary
%Description

R1=round(P(1));
R2=round(P(2));

hG = [R1-delta  R2-delta];
hD = [R1+delta  R2-delta];
bG = [R1-delta  R2+delta];
bD = [R1+delta  R2+delta];

end

