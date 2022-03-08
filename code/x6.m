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
f=5;
deltaT=0;


for n=1:N
    temps(n)=(n-1)*Te+a;
    freq(n)=(n-1)*deltaF -fe/2;
    y(n)=exp(-pi*(temps(n))^2);
    Ythe(n)=exp(-pi*(f)^2);
end


Y=tfour(y);
figure(1);
plot(temps,y,'b*');
figure(2);
plot(freq,real(Y/3277),'r*',temps,y,'b-');
axis([-5,+5,0,1]);
figure(3);
plot(freq,Ythe,'g*');

