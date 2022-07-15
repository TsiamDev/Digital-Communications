function [xq, MSE, SNR, D] = Lloyd_Max(x, N, min_value, max_value, tol)
    x_original = x;
    %Get total number of QLevels (upper bound)
    b = 2^N;
    %Get a random number of Qlevels
    M = randi(b) + 1;
    if M == b + 1
        M = b;
    end
    M = 2^N
    %Calculate Qlevels' values
    step = (max_value-min_value)/(M-1)
    x_hat = min_value:step:max_value
    a_i = zeros(1, length(x_hat)-1);
    a_i(1, :) = -((length(x_hat)-1)/2):1:((length(x_hat)-1)/2 - 1)
    %mid = mean(x)
    %scatter(1:length(level_vals), level_vals)
    
    MSE = zeros(1,100);
    SNR = zeros(1,100);
    MSE(1, 1) = inf;
    SNR(1, 1) = inf;
    p = 2;
    
    [xq, d] = helper_func(x_original, a_i, x_hat, min_value, max_value);
    [mse, snr] = metrics(x_original, xq);
    MSE(1, p) = mse;
    SNR(1, p) = snr;
    p = p + 1;
    my_plot(x, xq, x_hat, MSE, SNR)

    MSE
    SNR
    %x = xq;
    
    %Initialize first mean distortion
    D = zeros(1, 100);
    D(1, 1) = d;
    it = 2;
    cur_tol = log10(abs(D(1, it) - D(1, it-1)))
    while (cur_tol > tol) && ( MSE(1, it) - MSE(1, it-1) > 0 )
        [xq, x_hat, d] = helper_func2(x, a_i, min_value, max_value);
        D(1, it) = d;
        
        [mse, snr] = metrics(x_original, xq);
        MSE(1, p) = mse;
        SNR(1, p) = snr;
        p = p + 1;
        
        my_plot(x, xq, x_hat, MSE, SNR)

        MSE;
        SNR;
        %x = xq;
        
        it = it + 1;
        cur_tol = log10(abs(D(1, it) - D(1, it-1)))
    end
    [mse, snr] = metrics(x_original, xq);
    MSE(1, p) = mse;
    SNR(1, p) = snr;
    p = p + 1;
    my_plot(x_original, xq, x_hat, MSE, SNR)

    MSE
    SNR
end