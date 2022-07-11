function [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value)
    %Get total number of QLevels (upper bound)
    b = 2^N;
    %Get a random number of Qlevels
    M = randi(b) + 1;
    if M == b + 1
        M = b;
    end
    M = 2^N
    %Calculate Qlevels' values
    step = (max_value-min_value)/M
    level_vals = min_value:step:max_value
    %mid = mean(x)
    %scatter(1:length(level_vals), level_vals)
    %Calculate Centroids
    centers = zeros(1, length(level_vals)-1);
    for i = 1:(length(level_vals)-1)
        centers(i) = (level_vals(1,i) + level_vals(1,i + 1)) / 2;
    end
    centers(1) = min_value;
    centers(end) = max_value;
    centers
    
    f = @(x) exp((x.^2)./2).*(1/((2*pi).^(1/2)));
    xf = @(x) x.*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
    %Evaluate the integral from x=min_value to x=max_value
    x_hat = zeros(1, length(level_vals)-1);
    for i = 1:(length(level_vals)-1)
        x_hat(1,i) = integral(xf,level_vals(i),level_vals(i+1))/integral(f,level_vals(i),level_vals(i+1));
    end
    x_hat
    
    %Quantize original vector
    xq = zeros(1, length(level_vals)-1);
    for i = 1:(length(x))
        for j = 1:(length(x_hat)-1) 
            %if (x(1,i) > x_hat(1,j)) && (x(1,i) <= x_hat(1,j+1))
            if (x(1,i) > level_vals(1,j)) && (x(1,i) <= level_vals(1,j+1))
                xq(i) = centers(1,j);
                break
            end
        end
    end
    D = [];
end