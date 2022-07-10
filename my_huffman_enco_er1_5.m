function [code, avg_len] = my_huffman_enco_er1_5(img, symbols, freqs)
    dict = my_huffman_dict(symbols, freqs);
    
    %calculate average length of code
    sum_ = 0;
    for i = 1:length(dict)
        sum_ = sum_ + strlength(dict(i, 3));
    end
    avg_len = sum_ / length(dict);
    
    sz = size(img);
    %code = repmat(' ',256,256);
    code = cell(256,256);
    for i = 1:sz(1)
        for j = 1:sz(2)
            cur_letter = string(img(i,j));

            t = strcmp(string(dict(:,1)), cur_letter);
            k = find(t);
            code(i,j) = dict(k,3);
        end
    end
    %out = string(code);
    %code = out;
    
    onestring = strjoin(code, '');
    bitstring = reshape(dec2bin(onestring, 8).', 1, []);
    code = string(bitstring);
    for i = 1:sz(1)
        for j = 1:sz(2)
            
        end 
    end
end