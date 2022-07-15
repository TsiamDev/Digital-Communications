function [xq, D] = helper_func(x, a_i, x_hat)
    %Calculate mean distrortion
    D = zeros(1, length(a_i));
    for i = 1:(length(a_i)-1)
        b = x_hat(1, i);
        x_xhat_f = @(x) ((x - b).^2).*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
        D(1, i) = integral(x_xhat_f, a_i(1, i), a_i(1, i + 1));
    end
    D = sum(D);
    
    %Quantize original vector
    xq = zeros(1, length(x));
    for i = 1:(length(x))
        for j = 1:(length(x_hat)-1) 
            if (x(1,i) >= x_hat(1,j)) && (x(1,i) <= x_hat(1,j+1))
                xq(1, i) = x_hat(1,j);
                break
            end
        end
    end
end