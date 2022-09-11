function ImRGB = insertPyr(ImRGB, S0,S1,S2,S3,S4)

% Summary : On insert une pyramide stylise dans une image
%
% Description : On insert une pyramide stylise de sommet S0 dont la base
% est definie par S1, S2, S3 et S4

B = cell(4);

for j = 1:4
        B{1,j} = [round(((4-j)/4)*S0(1)+(j/4)*S1(1));round(((4-j)/4)*S0(2)+(j/4)*S1(2))];
        B{2,j} = [round(((4-j)/4)*S0(1)+(j/4)*S2(1));round(((4-j)/4)*S0(2)+(j/4)*S2(2))];
        B{3,j} = [round(((4-j)/4)*S0(1)+(j/4)*S3(1));round(((4-j)/4)*S0(2)+(j/4)*S3(2))];
        B{4,j} = [round(((4-j)/4)*S0(1)+(j/4)*S4(1));round(((4-j)/4)*S0(2)+(j/4)*S4(2))];
end

ImRGB = insertSegment(S0,S1,ImRGB);
ImRGB = insertSegment(S0,S2,ImRGB);
ImRGB = insertSegment(S0,S3,ImRGB);
ImRGB = insertSegment(S0,S4,ImRGB);

for j = 1:4
    ImRGB = insertSegment(B{1,j},B{4,5-j},ImRGB);
    ImRGB = insertSegment(B{2,j},B{1,5-j},ImRGB);
    ImRGB = insertSegment(B{3,j},B{2,5-j},ImRGB);
    ImRGB = insertSegment(B{4,j},B{3,5-j},ImRGB);
end

end

