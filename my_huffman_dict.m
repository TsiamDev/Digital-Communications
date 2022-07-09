function [c] = my_huffman_dict(symbols, probs)
    %get size
    len_s = length(symbols);
    len_p = length(probs);
    if len_s ~= len_p
        disp('length of symbols and propabilities must match');
        return
    end
    %initialize emtpy cell array    
    c = cell(len_s, 3);
    for i = 1:len_s
        c(i,1) = {symbols(i,1)};
        c(i,2) = {probs(i,1)};
        c(i,3) = {''};
    end
    
    %step-by-step creation of huffman dict
    for i = 1:len_s-1
        %add the two last probs
        c(end-1,2) = {c{end,2} + c{end-1,2}};
        %merge the last prob
        c(end,2) = {-1};
        
        %update the code words
        c(end-1,3) = strcat(c(end-1,3), '0');
        c(end,3) = strcat(c(end,3), '1');
        c(1:i-1,3) = strcat(c(1:i-1,3), '1');
        
        % circularly shift the cell array
        c = circshift(c,1);
    end
    c = circshift(c,1);
end