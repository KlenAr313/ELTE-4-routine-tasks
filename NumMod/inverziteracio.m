function [lambda, v] = inverziteracio(A,x0,N)
x0=x0(:);
for k=1:N
    x1=A\x0;
    [~,i]=max(abs(x0));
    lambda=x1(i)/x0(i);
    x0=x1;
end
v=x1/norm(x1);
lambda = 1/ lambda;
end