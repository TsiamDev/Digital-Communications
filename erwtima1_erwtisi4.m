[freqs2d] = Calculate_Extended_Source_Freqs(1);

[dict2d, avg_len] = my_huffman_2d_enco(freqs2d);

%calculate source entropy
sum_ent = 0;
for i = 1:length(freqs2d)
    if freqs2d(i) > 0
        sum_ent = sum_ent + freqs2d(i) * log2(1/freqs2d(i));
    end
end
ent = strcat("Source Entropy: ", string(sum_ent));
disp(ent);

avglen = strcat("Average Length of code: ", string(avg_len));
disp(avglen);

efficiency = sum_ent / avg_len;
ef = strcat("Code Efficiency: ", string(efficiency));
disp(ef);