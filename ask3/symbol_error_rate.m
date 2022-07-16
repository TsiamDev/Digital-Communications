function [SER] = symbol_error_rate(x, y, M)
    SER = 0;
    for i = 1:M:length(x)
        if (i + M - 1) < length(x)
            t = abs(x(1, i:(i+M-1)) - y(1, i:(i+M-1)));
            if sum(t) ~= 0
                SER = SER + 1;
            end
        end
    end
    SER = log10(SER);
end