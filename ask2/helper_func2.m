function [xq, x_hat, D] = helper_func2(x, a_i, min_value, max_value)
    f = @(x) exp((x.^2)./2).*(1/((2*pi).^(1/2)));
    xf = @(x) x.*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
    %Evaluate the integral from x=min_value to x=max_value
    x_hat = zeros(1, length(a_i) + 1);
    for i = 2:(length(a_i))
        x_hat(1, i) = integral(xf, a_i(1, i-1), a_i(1, i))/integral(f, a_i(1, i-1), a_i(1, i));
    end
    %x_hat(1, 1) = min_value;
    %x_hat(1, end) = max_value;
    x_hat
    %}
    
    %Calculate a_i's
    a_i2 = zeros(1, length(a_i));
    for i = 1:((length(a_i)-1))
        a_i2(1, i) = (x_hat(1, i) + x_hat(1, i + 1)) / 2;
    end
    %a_i2(1, length(a_i)) = 1;
    a_i = a_i2;
    
    %Calculate mean distrortion
    D = zeros(1, length(a_i));
    for i = 1:(length(a_i)-1)
        b = x_hat(1, i);
        x_xhat_f = @(x) ((x - b).^2).*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
        D(1, i) = integral(x_xhat_f, a_i(1, i), a_i(1, i+1));
    end
    D = sum(D);
    
    %level_vals = x_hat
    %Quantize original vector
    xq = zeros(1, length(x));
    for i = 1:(length(x))
        for j = 1:(length(x_hat)-1) 
            %if (x(1,i) > x_hat(1,j)) && (x(1,i) <= x_hat(1,j+1))
            if (x(1,i) >= x_hat(1,j)) && (x(1,i) <= x_hat(1,j+1))
                xq(1, i) = x_hat(1,j);
                break
            end
        end
    end
end