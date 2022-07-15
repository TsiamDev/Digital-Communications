function [MSE, SQNR] = metrics(x, xq)
    MSE = 0;
    for i = 1:length(x)
       MSE = MSE + (x(i) - xq(i)).^2;
    end
    MSE = MSE / length(x);
    
    %Assuming that the quantization noise 
    %is the dominant noise source, SQNR == SNR
    %Source: https://dsp.stackexchange.com
    SQNR = snr(x, xq);
end