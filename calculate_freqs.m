function [letters, freqs, tex, counts] = calculate_freqs(f)
    
    if f == 1
        freqs = readmatrix('frequencies.txt');
        freqs = freqs(:,2);
    end
    
    tex = fileread('cvxopt-small.txt');
    letters = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';
        'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z';' '];

    counts = zeros(27,1);
    total_letters = 0;
    for i = 1:27
        sum_ = count(tex, letters(i));
        counts(i) = sum_;
        total_letters = total_letters + sum_;
    end
    
    if f ~= 1
        freqs = zeros(27,1);
        for i = 1:27
            freqs(i) = counts(i) / total_letters;
        end
    end
end
