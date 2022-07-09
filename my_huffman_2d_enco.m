function [dict2d, avg_len] = my_huffman_2d_enco(freqs2d)
    letters = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';
        'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z';'_';];

    len_l = length(letters);
    symbols2d = cell(len_l,len_l);
    for i = 1:len_l
        for j = 1:len_l
            symbols2d(i,j) = {strcat(letters(i,1), letters(j,1))}; 
        end
    end
    %flatten to 1D array
    symbols2d = reshape(symbols2d.',[], 1);
    
    dict2d = my_huffman_dict(symbols2d, freqs2d);
    %dict2d = sort(dict2d(:, 2));
    %calculate average length of code
    sum_ = 0;
    for i = 1:length(dict2d)
        sum_ = sum_ + strlength(dict2d(i, 3));
    end
    avg_len = sum_ / length(dict2d);
end