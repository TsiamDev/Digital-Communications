function [code] = my_huffman_enco(symbols, probs)
    c = my_huffman_dict(symbols, probs);
    len_c = length(c)
    code = '';
    for i = 1:len_c
       %disp(i)
       code = strcat(code, c(i,3));
    end
end