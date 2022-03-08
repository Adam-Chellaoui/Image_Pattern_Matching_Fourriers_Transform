N=32768;
a=-5;
b=5;
Te=(b-a)/N;
fe=1/Te;
deltaF=fe/N;
c=2;
temps=zeros(1,N);
y=zeros(1,N);
freq=zeros(1,N);
f=2*3276.8;% quand on mets deux nombres après la virgule on obtient un nombre non entiers de période par seconde et on remarque qu'il y aura non recollement en dupliquant la figure et la recollant du cote droit de la figure dons  on a plus un sinus ce qui explique!
deltaF=50;

for n=1:N
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    y(n)=sin(2*pi*f*temps(n))+sin(2*pi*(f+deltaF)*temps(n))+sin(2*pi*(f+2*deltaF)*temps(n))+2*sin(2*pi*(f+3*deltaF)*temps(n));
end

Y=tfour(y);
figure(1);
plot(temps,y);
figure(2);
plot(freq,imag(Y),'r.');
    