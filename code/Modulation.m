N=32768;
a=-5;
b=5;
Te=(b-a)/N;
fe=1/Te;
f1=200;
f2=500;
deltaF=fe/N;
temps=zeros(1,N);
 freq=zeros(1,N);
S1=zeros(1,N);
S2=zeros(1,N);
M1=zeros(1,N); % Signale S1 modulé
M2=zeros(1,N);% Signale S2 modulé
D1=zeros(1,N); %Signale demodulé contenant S1
D2=zeros(1,N); % Signale  demodulé contenant S2
MT=zeros(1,N); % Signale Transmis
filtre= zeros(1,N) %Filtre passe bas

% Les signaux S1 et S2
for n=1:N
    for k=1:10
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    S1(n)=S1(n)+k*cos(2*pi*10*k*temps(n));
    S2(n)=S2(n)+(11-k)*cos(2*pi*10*k*temps(n));
    M1(n) = S1(n)*cos(2*pi*f1*temps(n));
    M2(n) = S2(n)*cos(2*pi*f2*temps(n));
    MT(n)= M1(n)+M2(n);
    D1(n)= MT(n)*cos(2*pi*f1*temps(n));
    D2(n)= MT(n)*cos(2*pi*f2*temps(n));
   
    end
    if freq(n)>-105 && freq(n)<105
        filtre(n)=1;
    end
end


Y=tfour(S2);
X=tfour(D2);
Xfinal= X.*filtre;
 

figure(1);
plot(freq,real(2*Xfinal),'b-'); % parce qu'on ne récupère que la moitier du signal
 figure(2);
plot(freq,real(Y),'r-');