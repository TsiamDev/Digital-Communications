%Set Seed for reproducible results
rng(42);

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
tol = 0.0001;
[xq, centers, D] = Lloyd_Max(x, N, min_value, max_value, tol);
%plot(xq);
%hold off;

%Second Part
h = stem(1:length(xq), xq, 'linewidth', 2);
%hold on
%h = stem(1:length(centers), centers, 'linewidth', 2);
hold on
plot(1:length(x), x, 'linewidth', 2)
lgd = legend('QLevels', 'Centers', 'Continuous Data');
set (lgd, "fontsize", 12)
title('Time vs Magnitude','fontweight','bold','fontsize',16);
xlabel('Time(s)','fontweight','bold','fontsize',14)
ylabel('Magnitude','fontweight','bold','fontsize',14)
grid
hold off