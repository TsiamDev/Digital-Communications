function [letters, freqs, tex, counts] = calculate_freqs(f)
    
    if f == 1
        freqs = readmatrix('frequencies.txt');
        freqs = freqs(:,2);
    end
    
    tex = fileread('cvxopt.txt');
    letters = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';
        'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z';'_'];
    
    len_l = length(letters);
    counts = zeros(len_l,1);
    total_letters = 0;
    for i = 1:len_l
        if letters(i) ~= '_'
            sum_ = count(tex, letters(i));
        else
            sum_ = count(tex, ' ');
        end
        counts(i) = sum_;
        total_letters = total_letters + sum_;
    end
    
    if f ~= 1
        freqs = zeros(length(letters),1);
        for i = 1:length(letters)
            freqs(i) = counts(i) / total_letters;
        end
    end
end
