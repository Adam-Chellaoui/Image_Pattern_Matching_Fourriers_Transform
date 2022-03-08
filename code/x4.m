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
f=0.1;
deltaT=0;


for n=1:N
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    y(n)=exp(j*2*pi*f*temps(n));
    
end

Y=tfour(y);
figure(1);
plot(temps,real(y),'b*');
figure(2);
plot(freq,real(Y),'r*');