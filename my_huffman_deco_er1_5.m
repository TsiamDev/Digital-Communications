function [sig] = my_huffman_deco_er1_5(code, symbols, probs)
    dict = my_huffman_dict(symbols, probs);
    %code = char(code);
    
    huff_codes = dict(:,3);
    len_hc = length(huff_codes);

    sig = '';
    len_c = length(code);
    
    i = len_c - 26;
    last_i = i;
    j = len_c;
    while last_i >= 1
        while j >= 1
            code_chunk = code(i:j);
            for k = 1:len_hc
                hc = string(huff_codes(k));
                
                if strcmp(code_chunk, hc)
                    sig = strcat(sig, dict(k));
                    %i = j;
                    j = i - 1;
                    break
                end
            end
            %j = j - 1;
            if j == i - 1
                break
            else
                i = i + 1;
            end
        end
       last_i = last_i - 1;
       i = last_i;
    end 
    sig = reverse(sig);
end