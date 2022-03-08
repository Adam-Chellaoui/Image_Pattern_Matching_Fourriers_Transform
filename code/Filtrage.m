%Ouverture de l'image
[im,map]=imread('ndg-bellecour.png');

% Initialisation de variables
dim = size(im,1); %Dimensions de l'image carré 
K=0.005;
H=zeros(dim);

% Construction d'une palette 'Niveau de Gris' 
gris=([0:255]/255)'*[1 1 1] ;

% Affichage normal de l'image
figure(1);
image(im);
colormap(gris);
title("Image d'origine en gris");
im=double(im) ;
IM=fft2(im) ;
IM=fftshift(IM) ;
logIM=log(abs(IM)+1) ;
maxi=max(max(logIM)) ;
mini=min(min(logIM)) ;
figure(2);
image((logIM-mini)/(maxi-mini)*255 );
colormap(gris);

for u=1:dim
    for v=1:dim
        H(u,v)=exp(-K*((u-(dim/2+1))^2+(v-(dim/2+1))^2));
    end
end


IM= IM.*H;
im_traitee=real(ifft2(fftshift(IM))) ;
figure(3);
image(im_traitee);
colormap(gris);

title("Image filtrée en gris K=0.005");