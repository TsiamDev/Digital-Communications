symbols = 1:6; 
p = [.5 .125 .125 .125 .0625 .0625];

dict = huffmandict(symbols,p);
%Generate a vector of random symbols.

inputSig = randsrc(100,1,[symbols;p]);
%Encode the random symbols.

code = huffmanenco(inputSig,dict)