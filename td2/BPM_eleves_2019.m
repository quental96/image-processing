% Optique guidée : TD BPM 
% Janvier 2019
% Simulation de la propagation linéaire dans une fibre optique à gradient d'indice : aspects
% spatiaux 2D "BPM"

clear all
close all
% --------------------- TABLEAUX ------------------------------------------

% Espace de travail "spatial"
deltax = 200; % dimension de l'espace de travail suivant x en microns
deltay = 200; % dimension de l'espace de travail suivant y en microns
nx = 400; % nbre d'échantillons suivant x (Number of samples)
ny = 400; % nbre d'échantillons suivant y
pasx = deltax/nx; % pas d'échantilonnage en x (Step in µm)
pasy = deltay/ny; % pas d'échantilonnage en y
x = [-deltax/2  : pasx : deltax/2-pasx];
y = [-deltay/2  : pasy : deltay/2-pasy];
[X,Y] = meshgrid(x,y); % espace "Positions spatiales"

% espace de travail "fréquentiel"
pasnux = 1/deltax; % pas d'échantillonnage en fréquence (spatiale) suivant x
pasnuy = 1/deltay; % pas d'échantillonnage en fréquence (spatiale) suivant y
nux  = [-1/(2*pasx) : pasnux : 1/(2*pasx)-pasnux]; % vecteur fréquence spatiale en x
nuy  = [-1/(2*pasy) : pasnuy : 1/(2*pasy)-pasnuy]; % vecteur fréquence spatiale en y
[NUX,NUY] = meshgrid(nux,nuy);  % espace "Fréquences spatiales"

% --------------------- FIBER PARAMETRES ----------------------------------------
lambda=1.55; % longueur d'onde de travail en microns
k0 = 2*pi/lambda; % vecteur d'onde en (microns)-1

deltaIndice = 0.003;  %variation d'indice
rayonCoeur = 7;  %en µm
h = rayonCoeur/sqrt(2*deltaIndice); % en µm
n1=1.47; %indice maximal du coeur
w0_2 = 2*h/(n1*k0); % waist optimal (au carré)

% --------------------- PROFIL INITIAL ------------------------------------

% Profil gaussien : mode LP01
 se_LP01 = exp(-(X.^2+Y.^2)/(w0_2));
 se  = se_LP01; % se est le profil utilisé par la suite. 
 
 
  % --------------------- PAS D'ECHANTILLONNAGE SELON Z ------------------------------------

 deltaz = min(pi*w0_2/lambda, lambda/(deltaIndice*n1)); % pas suivant la direction de propagation z en microns
 
 % ---------------------- OPERATEURS ---------------------------------
% opérateur (fonction de transfert) de propagation en espace libre

D = exp(1i*pi*(NUX.^2+NUY.^2)*lambda*deltaz/n1);

% opérateur de changement de phase dû au gradient d'indice

L = exp(1i*k0*n1*(X.^2+Y.^2)*deltaz/(2*h^2));

 % ---------------------- PROPAGATION ---------------------------------
 
% Mise en place de l'algorithme de BPM

fft_se = fft2(se);
fft_se_dif = fft_se.*fftshift(D);
se_dif = ifft2(fft_se_dif);
si = se_dif.*L;


subplot(2,2,1)
surf(X,Y, abs(se)), shading interp, colorbar
subplot(2,2,2)
surf(X,Y,abs(se_dif)), shading interp, colorbar
subplot(2,2,3)
surf(X,Y,abs(si)), shading interp, colorbar

N=1000;

s = se ;

for i=1:N
    fft_s = fft2(s);
    fft_s_dif = fft_s.*fftshift(D);
    s_dif = ifft2(fft_s_dif);
    s=s_dif.*L;
end

figure
surf(X,Y, abs(se)), shading interp, colorbar
figure
surf(X,Y, abs(s)), shading interp, colorbar
