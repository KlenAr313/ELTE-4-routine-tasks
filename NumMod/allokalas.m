N=1e+6;

%% A)
clear x;
tic
for k = 1:N
    x(k) = k;
end;
toc

%% B)

clear x
x = zeros(1, N);
for k=1:N
    x(k) = k;
end
toc

%% C)

x=1:N;

toc