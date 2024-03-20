function B = forgat(A,i,j)
    n=size(A,1);
    Q=eye(n);
    u = 2*A(i,j);
    v= A(j,j) - A(i,i);
    w = sqrt(u^2 + v^2);
    c=sqrt((w+v*sign(u))/2*w);
    s = (u*sign(u))/2*c*w;
    Q(i,i)=c;
    Q(i,j)=s;
    Q(j,i)=-s;
    Q(j,j)=c;
    
    G=A;
    G(i,:)=c*A(i,:)-s*A(j,:);
    G(j,:)=s*A(i,:)+c*A(j,:);

    B=G;
    B(:,i)=c*G(:,i)-s*G(:,j);
    B(:,i)=s*G(:,i)+c*G(:,j);
    
    B(i,j)=0;
    B(j,i)=0;
end