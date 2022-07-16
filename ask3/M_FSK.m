function [x, out_symbols, M] = M_FSK()
    %L_b = 10;
    L_b = 10^4;
    x = randsrc(1, L_b);
    for i = 1:L_b
       if x(1, i) == -1
           x(1, i) = 0;
       end
    end

    %Symbol Period (difference)
    T_symbol = 10^-6;
    %Carrier Wave Period
    T_c = 0.4*10^-6;

    %Number of source symbols - round towards +inf
    M = ceil(log2(L_b));
    m = 0:(2*M);
    step = T_c / 4;
    z = length(m) * step;
    t = 0:step:(z-step);

    %Square wave
    g = sqrt((2.*t)./T_symbol);

    %symbol carrier wave
    j = (1/T_c + m/T_symbol);
    s_m = cos((2*pi*j).*t);

    %SNR
    SNR = 0:5:40;

    %noise variance
    variance = (10.^(-SNR ./ 10)) ./ (2 * M);
    rs = randn(ceil((L_b * 40) / M), 1);
    noise = sqrt(variance).*rs;
    %Add AWGN (due to channel) to the input signal
    ns = noise(1:(length(x)));
    y = x + ns;


    %Demodulator
    r = sum(y.*s_m');

    %carrier decoding
    out_symbols = zeros(1, L_b);
    for i = 1:length(r)
        if r(1, i) < 0
            out_symbols(1, i) = 1;
        else
            out_symbols(1, i) = 0;
        end
    end
end