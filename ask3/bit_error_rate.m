function [BER] = bit_error_rate(x, y)
    BER = 0;
    for i = 1:length(x)
        if abs(x(1, i) - y(1, i)) ~= 0
            BER = BER + 1;
        end
    end
    BER = log10(BER);
end