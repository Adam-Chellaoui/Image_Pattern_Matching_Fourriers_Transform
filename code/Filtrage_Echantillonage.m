%Ouverture de l'image
[im,map]=imread('Thorg.bmp');

% Initialisation de variables
dim = size(im,1); %Dimensions de l'image carré 
K=0.005;
H=zeros(dim);
nouvelle_Image=zeros(dim/4);

% Construction d'une palette 'Niveau de Gris' 
gris=([0:255]/255)'*[1 1 1] ;

% Affichage normal de l'image
figure(1);
image(im);
colormap(gris);
title("Image d'origine en gris");


for u=1:dim/4
    for v=1:dim/4
            nouvelle_Image(u,v)=im(u*4,v*4);
    end
end


figure(3);
image(nouvelle_Image);
colormap(gris);

title("Image divisée par 4");