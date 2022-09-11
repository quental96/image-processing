function ImRGB = insertSegment(s1,s2,ImRGB)

% Summary : On insert un segment 3D sur notre image 
% Description

d = floor(sqrt((s1(1)-s2(1))^2 + (s1(2)-s2(2))^2));
n = 2*d-1;

for i = 0:n
    x = round((i/n)*s2(1)+((n-i)/n)*s1(1));
    y = round((i/n)*s2(2)+((n-i)/n)*s1(2));
    ImRGB(y,x,1) = round(255);
    ImRGB(y,x,2) = round(255);
    ImRGB(y,x,3) = round(255);
end

end

