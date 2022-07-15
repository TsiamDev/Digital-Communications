%Set Seed for reproducible results
rng(2);

%Number of samples
M = 20;

%Generate random samples ~N(0,1)
x = randn(1, M);
%plot(x);
%hold on;

%Number of bits
N = 4;
min_value = min(x)
max_value = max(x)
tol = 1;
[xq, MSE, SNR, D] = Lloyd_Max(x, N, min_value, max_value, tol);