%Set Seed for reproducible results
rng(2);

%Number of samples
M = 20;

%Generate random samples AR(M)
x = randn(1, M);
b = 1;
a = [1 1/2 1/3 1/4 1/5 1/6 ];
x = filter(b,a,x);
%plot(x);
%hold on;

%Number of bits
N = 4;
min_value = min(x)
max_value = max(x)
tol = 1;
[xq, MSE, SNR, D] = Lloyd_Max(x, N, min_value, max_value, tol);