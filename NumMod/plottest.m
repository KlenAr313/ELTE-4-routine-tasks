x=linspace(0,2*pi,100);

subplot(2,1,1)
plot(x,sin(x),'r-')
hold on
plot(x,cos(x),'b-')
hold off

subplot(2,1,2)
plot(x,sin(2*x),'r-')
hold on
plot(x,cos(2*x),'b-')
hold off