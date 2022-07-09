function [code, avg_len] = my_huffman_enco(tex, symbols, probs)
    dict = my_huffman_dict(symbols, probs);
    
    %calculate average length of code
    sum_ = 0;
    for i = 1:length(dict)
        sum_ = sum_ + strlength(dict(i, 3));
    end
    avg_len = sum_ / length(dict);
    
    len_t = length(tex);
    code = '';
    for i = 1:len_t
       cur_letter = string(tex(i));
       if cur_letter == ' '
           cur_letter = '_';
       end
       t = strcmp(dict(:,1), cur_letter);
       j = find(t);
       code = strcat(code, dict(j,3));
    end
end