function [img, symbols, freqs] = calculate_img_freqs()
    %load a 256x256 picture 
    %each pixel is assigned a value in [0,255]    
    img = load('cameraman.mat');
    % reformating
    img = img.i;
    %img = img.i(1:20,1:20);
    %view image
    %imagesc(img)
    
    %generate the symbols of the source
    symbols = 0:255;
    symbols = symbols';
    
    % get the size of the image
    sz = size(img);
    
    % count the occurences of each "symbol"
    counts = zeros(256,1);
    for i = 1:sz(1)
        for j = 1:sz(2)
           counts(img(i,j)) = counts(img(i,j)) + 1; 
        end
    end
    
    total_symbols = sum(counts);
    
    %calculate symbol frequencies
    for i = 1:sz(1)
        counts(i) = counts(i) / total_symbols;
    end
    freqs = counts;
end