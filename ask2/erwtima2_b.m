%Initialize random number generator
%for reproduce-ability
rng(0,'twister');

%Get a random number of Qlevels
%number of bits/symbol 
N = 4
b = randi(N) + 1;
if b == N + 1
    b = N;
end
b = 2^b

%k-means clustering
k = 5;
M = 10;
%Generate AR(M) samples
X = randn(1,M);
b_ = 1;
a = [1 1/2 1/3 1/4 1/5 1/6 ];
X = filter(b_,a,X');
[idx, C] = kmeans(X,k);

%Quantization
max_value = max(X);
min_value = min(X);
step = (max_value - min_value) / (b-1);
%x_hat = zeros(1, min_value:step:max_value);
%x_hat(1, :) = min_value:step:max_value;
x_hat = min_value:step:max_value;
%a_i = 1:M;

figure;
subplot(1,2,1);
stem(x_hat);
lgd = legend('x_hat');
set (lgd, "fontsize", 12)
title('x_hat','fontweight','bold','fontsize',16);
xlabel('a/a','fontweight','bold','fontsize',14)
ylabel('Quantized values','fontweight','bold','fontsize',14)
grid
hold on;
centroids = zeros(1, k);
for i = 1:k
   for j = 1:(b - 1)
      if (C(i, 1) >= x_hat(1, j)) && (C(i, 1) <= x_hat(1, j + 1))
          centroids(1, i) = x_hat(1, j);
          break
      end
   end
end
subplot(1,2,2);
stem(centroids);
lgd = legend('Centroids');
set (lgd, "fontsize", 12)
title('k-means Centroids','fontweight','bold','fontsize',16);
xlabel('a/a','fontweight','bold','fontsize',14)
ylabel('Quantized Centroid','fontweight','bold','fontsize',14)
grid
hold off;


%Quantize input signal based on centroids
centroids = sort(centroids);
x_out = zeros(M, 1);
for i = 1:M
   for j = 1:(k - 1)
       if (X(i, 1) <= centroids(1, 1))
           x_out(i ,1) = centroids(1, 1);
           break
       elseif (X(i, 1) >= centroids(1, k - 1))
           x_out(i, 1) = centroids(1, k - 1);
           break
       elseif (X(i, 1) > centroids(1, j)) && (X(i, 1) < centroids(1, j + 1))
               x_out(i, 1) = centroids(1, j);
               break
       end
   end
end
figure;
stem(1:length(X), X)
hold on;
stem(1:length(x_out), x_out)
lgd = legend('X', 'x\_out');
set (lgd, "fontsize", 12)
title('X vs x\_out','fontweight','bold','fontsize',16);
xlabel('Iteration','fontweight','bold','fontsize',14)
ylabel('Value','fontweight','bold','fontsize',14)
hold off;

[MSE, SQNR] = metrics(X, x_out)

%{
idx = sort(C)
stem(C(idx));
hold on;
plot(X(idx));
hold off;
%}