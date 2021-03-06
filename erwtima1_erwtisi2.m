%Calculate propability for each letter
%based on the provided text
[letters, freqs, tex] = calculate_freqs(0);

[code, avg_len] = my_huffman_enco(tex, letters, freqs);
sig = my_huffman_deco(code, letters, freqs);

disp(strcat("Original text: ", tex))
disp(strcat("Huffman Encoding: ", code))
disp(strcat("Decoded signal: ", sig))

%calculate source entropy
sum_ent = 0;
for i = 1:length(freqs)
    if freqs(i) > 0
        sum_ent = sum_ent + freqs(i) * log2(1/freqs(i));
    end
end
ent = strcat("Source Entropy: ", string(sum_ent));
disp(ent);

avglen = strcat("Average Length of code: ", string(avg_len));
disp(avglen);

efficiency = sum_ent / avg_len;
ef = strcat("Code Efficiency: ", string(efficiency));
disp(ef);
