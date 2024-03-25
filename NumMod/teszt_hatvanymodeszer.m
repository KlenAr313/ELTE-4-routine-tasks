N=3;
T = 2*(rand(N)-0.5);
%[T,~]=qr(T);
D = diag(1:N);
A = T*D/T;
e1=zeros(N,1);
e1(1)=1;
[lambda, ~]=hatvanymodszer(A,e1,10)