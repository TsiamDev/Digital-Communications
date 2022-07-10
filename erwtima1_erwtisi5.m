%Calculate propability for each letter
%based on the provided image
[img, symbols, freqs] = calculate_img_freqs();

disp('Begin Encoding...')
[code, avg_len] = my_huffman_enco_er1_5(img, symbols, freqs);
disp('Encoding Ended.')

%add noise
recv_sig = bsc(code);

disp('Begin Decoding...')
sig = my_huffman_deco_er1_5(recv_sig, symbols, freqs);

%disp(strcat("Original text: ", tex))
%disp(strcat("Huffman Encoding: ", code))
%disp(strcat("Decoded signal: ", sig))

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