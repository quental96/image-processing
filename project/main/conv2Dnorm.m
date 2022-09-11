function S = conv2Dnorm(V,P)
S = P*V;
S = S(1:2)/S(3);
end
 