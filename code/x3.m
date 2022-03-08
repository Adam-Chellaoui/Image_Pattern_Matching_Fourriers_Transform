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
deltaT=0;


for n=1:N
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    if(temps(n)==deltaT)
        y(n)=1;
    else
        y(n)=0;
    end
end

Y=tfour(y);
figure(1);
plot(temps,y,'b*');
figure(2);
plot(freq,real(Y),'r*');