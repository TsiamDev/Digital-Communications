function [xq, centers, D] = helper_func(x, level_vals, min_value, max_value)
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
        for j = 1:(length(level_vals)-1) 
            %if (x(1,i) > x_hat(1,j)) && (x(1,i) <= x_hat(1,j+1))
            if (x(1,i) > level_vals(1,j)) && (x(1,i) <= level_vals(1,j+1))
                xq(i) = centers(1,j);
                break
            end
        end
    end
    
    %Calculate mean distrortion
    D = zeros(1, length(level_vals));
    for i = 1:(length(level_vals)-1)
        b = x_hat(i);
        x_xhat_f = @(x) ((x - b).^2).*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
        D(1, i) = integral(x_xhat_f,level_vals(i),level_vals(i+1));
    end
    D = sum(D)
end