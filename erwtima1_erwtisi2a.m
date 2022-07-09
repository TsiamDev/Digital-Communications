function [freqs] = calculate_freqs()
    t = fileread('cvxopt.txt');
    letters = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';
        'l';'m';'n';'o';'p';'q';'r';'s';'t';'u';'v';'x';'y';'z';' '];

    counts = zeros(26,1);
    total_letters = 0;
    for i = 1:26
        sum_ = count(t, letters(i));
        counts(i) = sum_;
        total_letters = total_letters + sum_;
    end

    freqs = zeros(26,1);
    for i = 1:26
        freqs(i) = counts(i) / total_letters;
    end
end
