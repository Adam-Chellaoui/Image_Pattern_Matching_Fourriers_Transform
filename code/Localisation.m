%Ouverture de l'image
[im,map]=imread('ImageTest.png');

% Initialisation de variables
dim = size(im,1); %Dimensions de l'image carré 
K=0.005;
H=zeros(dim);
gris=([0:255]/255)'*[1 1 1] ;
nbF1=0;
nbF2=0;
nbF3=0;
% construction de l'image F1
F1= zeros(8);
figure(5);
colormap(gris);
F1(1,1:8) = 255;
F1(2,7)=255;
F1(3,6)=255;
F1(4,5)=255;
F1(5,4)=255;
F1(6,3)=255;
F1(7,2)=255;
F1(8,1)=255;
image(F1);
% construction de l'image F1
F2= zeros(8);
figure(6);
colormap(gris);
F2(8,1:8) = 255;
F2(2,7)=255;
F2(3,6)=255;
F2(4,5)=255;
F2(5,4)=255;
F2(6,3)=255;
F2(7,2)=255;
F2(1,8)=255;
image(F2);
% construction de l'image F1
F3= zeros(8);
figure(7);
colormap(gris);
F3(1,4) = 255;
F3(2,3)=255;
F3(2,5)=255;
F3(3,2)=255;
F3(3,6)=255;
F3(4,1)=255;
F3(4,7)=255;
F3(5,2)=255;
F3(5,8)=255;
F3(6,3)=255;
F3(6,7)=255;
F3(7,4)=255;
F3(7,6)=255;
F3(8,5)=255;
image(F3);

%dimensions des deux types d'images ({F1,F2,F3} et im)
dimensionGrandeImage = size(im);
dimensionPetiteImage = size(F1);

%--------------------------------------------------------------------------------------------------------------------------------

% Calcul de l'occurence de F1 dans l'image im
F1Echelle = zeros(dimensionGrandeImage(1), dimensionGrandeImage(2));

for i=1:dimensionPetiteImage(1)
    for j=1:dimensionPetiteImage(2)
        F1Echelle(i, j) = F1(i, j);
    end
end

% on commence nos calculs 
IM=fft2(double(im));
F1= fft2(double(F1Echelle));

%Permutation des cadrans pour afficher les basses fréquences au centre de l’image du spectre
IM=fftshift(IM);
F1=fftshift(F1);

%Calcul du produit de convolution 
convolutionF1 = IM .* F1;
convF1=real(ifft2(fftshift(convolutionF1)));

%pourcentage de proportion
pourcF1 = 0.95 * max(convF1, [],'all');
for i=1:dimensionGrandeImage(1)
    for j=1:dimensionGrandeImage(2)
        if (convF1(i, j) >= pourcF1)
            nbF1 = nbF1 + 1;
        end
    end
end

nbF1

%---------------------------------------------------------------------------------------------------------------------------------

% Calcul de l'occurence de F2 dans l'image im
F2Echelle = zeros(dimensionGrandeImage(1), dimensionGrandeImage(2));

for i=1:dimensionPetiteImage(1)
    for j=1:dimensionPetiteImage(2)
        F2Echelle(i, j) = F2(i, j);
    end
end

% on commence nos calculs 
F2= fft2(double(F2Echelle));

%Permutation des cadrans pour afficher les basses fréquences au centre de l’image du spectre
F2=fftshift(F2);

%Calcul du produit de convolution 
convolutionF2 = IM .* F2;
convF2=real(ifft2(fftshift(convolutionF2)));

%pourcentage de proportion
pourcF2 = 0.95 * max(convF2, [],'all');
for i=1:dimensionGrandeImage(1)
    for j=1:dimensionGrandeImage(2)
        if (convF2(i, j) >= pourcF2)
            nbF2 = nbF2 + 1;
        end
    end
end

nbF2


%---------------------------------------------------------------------------------------------------------------------------------

% Calcul de l'occurence de F3 dans l'image im
F3Echelle = zeros(dimensionGrandeImage(1), dimensionGrandeImage(2));

for i=1:dimensionPetiteImage(1)
    for j=1:dimensionPetiteImage(2)
        F3Echelle(i, j) = F3(i, j);
    end
end

% on commence nos calculs 
F3= fft2(double(F3Echelle));

%Permutation des cadrans pour afficher les basses fréquences au centre de l’image du spectre
F3=fftshift(F3);

%Calcul du produit de convolution 
convolutionF3 = IM .* F3;
convF3=real(ifft2(fftshift(convolutionF3)));

%pourcentage de présence càd quand on a trouvé (ou presque) la forme qu'on recherche dans l'image
pourcF3 = 0.95 * max(convF3, [],'all');
for i=1:dimensionGrandeImage(1)
    for j=1:dimensionGrandeImage(2)
        if (convF3(i, j) >= pourcF3)
            nbF3 = nbF3 + 1;
        end
    end
end


nbF3
