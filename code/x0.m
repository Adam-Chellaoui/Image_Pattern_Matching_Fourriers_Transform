
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


for n=1:N
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    y(n)=c;
end

Y=tfour(y);
figure(1);
plot(temps,y,'b*');
figure(2);
plot(freq,real(Y),'r*');
    