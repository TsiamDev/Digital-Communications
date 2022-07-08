function [sig] = my_huffman_deco(code, symbols, probs)
    dict = my_huffman_dict(symbols, probs);
    code = char(code);
    disp(code);
    %len_c = length(code)
    
    huff_codes = dict(:,3);
    len_hc = length(huff_codes);

    sig = '';
    i = 1;
    
    while i < length(code)
        j = length(code);
        while j >= 1
            code_chunk = code(i:j);
            for k = 1:len_hc
                hc = string(huff_codes(k));
                if strcmp(code_chunk, hc)
                    sig = strcat(sig, dict(k));
                    i = j;
                    break
                end
            end
            j = j - 1; 
        end
       i = i + 1;
    end 
end