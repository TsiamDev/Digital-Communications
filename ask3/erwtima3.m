rng(42);

N = 10000;
M = -1;
BER = zeros(1, N);
SER = zeros(1, N);
ind = 1;

for i = 1:N
    [x, out_symbols, M] = M_FSK();
    [BER(1, ind)] = bit_error_rate(x, out_symbols);
    [SER(1, ind)] = symbol_error_rate(x, out_symbols, M);
    ind = ind + 1;
end

subplot(1, 2, 1);
plot(SER);
lgd = legend('SER');
set (lgd, "fontsize", 12)
title('Symbol Error Rate','fontweight','bold','fontsize',16);
xlabel('Iteration','fontweight','bold','fontsize',14)
ylabel('log10(SER)','fontweight','bold','fontsize',14)
grid
hold on;
subplot(1, 2, 2);
plot(BER);
lgd = legend('BER');
set (lgd, "fontsize", 12)
title('Bit Error Rate','fontweight','bold','fontsize',16);
xlabel('Iteration','fontweight','bold','fontsize',14)
ylabel('log10(BER)','fontweight','bold','fontsize',14)
grid
hold off;