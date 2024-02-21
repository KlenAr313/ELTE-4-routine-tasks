x=rand(3);

x=[x; x(1,:)*0];
x(4,2)=-1;
x

%% Blokk
Y =x;
x=Y;
Y
