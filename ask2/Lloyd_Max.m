function [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value, tol)

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
    
    [xq, centers, D] = helper_func(x, level_vals, min_value, max_value);
    my_plot(x, xq)
    %Initialize first mean distortion
    D_last = 0;
    while abs(D - D_last) > tol
        D_last = D;
        
        %Calculate new Qlevels
        %level_vals = min_value:step:max_value
        xf = @(x) x.*exp((x.^2)./2).*(1/((2*pi).^(1/2)));
        %Evaluate the integral from x=min_value to x=max_value
        lv = zeros(1, length(centers)-1);
        for i = 1:(length(centers)-1)
            lv(1,i) = integral(xf,centers(i),centers(i+1));
        end
        level_vals = lv;
        [xq, centers, D] = helper_func(x, level_vals, min_value, max_value);
        
        my_plot(x, xq)

    end
end