N=3;
R = 2*(rand(N)-0.5);

%Rand sim
A = R*R';
norm(A-A');

%Rand ortogonal
[Q,~]=qr(R);
norm(Q*Q'-eye(N));

%Rand simm, ismert sajátértékekkel
D=diag(1:N);
A=Q*D*Q';
A;
eig(A);
