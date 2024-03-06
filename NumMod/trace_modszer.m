function p=trace_modszer(A)
    [n,~]=size(A);
    p=zeros(1,n);
    s=zeros(1,n);

    for k=1:n
        s(k)=trace(A^k);
        p(k)=-(1/k)*([1, p(1:k-1)])*s(k:-1:1)';
    end
    p=[1,p];
end