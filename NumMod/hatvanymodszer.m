function [lambda, v] = hatvanymodszer(A,x0,N)
sym= norm(A-A') <1e-7;
x0=x0(:);
for k=1:N
    x1=A*x0;
    if sym
        lambda=dot(x1,x0)/dot(x0,x0);
    else
        [~,i]=max(abs(x0));
        lambda=x1(i)/x0(i);
    end
    x0=x1;
end
v=x1/norm(x1);
end