function [freqs2d] = Calculate_Extended_Source_Freqs(f)
    [~, freqs, ~, ~] = calculate_freqs(f);
    
    %freqs2d = zeros(length(freqs),length(freqs));
    freqs2d = zeros(3,3);
    for i = 1:length(freqs)
        for j = 1:length(freqs)
            freqs2d(i,j) = freqs(i)*freqs(j);
        end
    end
    
    %flatten to 1D array
    freqs2d = reshape(freqs2d.',[], 1);
end