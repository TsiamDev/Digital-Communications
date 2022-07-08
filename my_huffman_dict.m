function [c] = my_huffman_dict(symbols, probs)
    %get size
    len_s = length(symbols)
    len_p = length(probs)
    if len_s ~= len_p
        disp('length of symbols and propabilities must match');
        return
    end
    %initialize emtpy cell array    
    c = cell(len_s, 3);
    for i = 1:len_s
        c(i,1) = {symbols(1,i)};
        c(i,2) = {probs(1,i)};
        c(i,3) = {''};
    end
    
    %step-by-step creation of huffman dict
    for i = 1:len_s-1
        %add the two last probs
        c(end-1,2) = {c{end,2} + c{end-1,2}};
        %merge the last prob
        c(end,2) = {-1};
        
        %update the code words
        c(end-1,3) = strcat(c(end-1,3), '0');
        if i > 1
            %c(end-2,3) = strcat(c(end-2,3), '0');
        end
        c(end,3) = strcat(c(end,3), '1');
        c(1:i-1,3) = strcat(c(1:i-1,3), '1');
        
        % circularly shift the cell array
        c = circshift(c,1);
        
        %store the symbols with <-1> propability
        %temp = c(1:i,:);
        %sort the rest of elements in the cell array
        %c_temp = cellfun(@num2str,c(i+1:end,2),'UniformOutput',false);
        %c_temp = sortrows(cell2mat(c(i+1:end,:)), 'descend');
        
        %c_temp = sortrows(c(i+1:end,:),2, 'descend');
        %and recombine the results in a new cell array
        %c = [temp; c_temp];
    end
    c = circshift(c,1);
end