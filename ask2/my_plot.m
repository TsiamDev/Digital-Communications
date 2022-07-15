function [] = my_plot(x, xq, x_hat, MSE, SNR)
    subplot(2,2,1)
    h = stem(1:length(xq), xq, 'linewidth', 2);
    hold on
    %h = stem(1:length(centers), centers, 'linewidth', 2);
    %hold on
    stem(1:length(x), x, 'linewidth', 2)
    lgd = legend('XQ', 'X');
    set (lgd, "fontsize", 12)
    title('Time vs Magnitude','fontweight','bold','fontsize',16);
    xlabel('Time(s)','fontweight','bold','fontsize',14)
    ylabel('Magnitude','fontweight','bold','fontsize',14)
    grid
    hold off
    
    subplot(2,2,2)
    stem(1:length(x_hat), x_hat, 'linewidth', 2);
    hold on;
    lgd = legend('X_hat');
    set (lgd, "fontsize", 12)
    title('Time vs Magnitude','fontweight','bold','fontsize',16);
    xlabel('Time(s)','fontweight','bold','fontsize',14)
    ylabel('Magnitude','fontweight','bold','fontsize',14)
    grid
    hold off
    
    subplot(2,2,3)
    stem(1:length(MSE), MSE, 'linewidth', 2);
    hold on;
    lgd = legend('MSE');
    set (lgd, "fontsize", 12)
    title('Iterations vs MSE','fontweight','bold','fontsize',16);
    xlabel('Iteration','fontweight','bold','fontsize',14)
    ylabel('MSE','fontweight','bold','fontsize',14)
    grid
    hold off
    
    subplot(2,2,4)
    stem(1:length(SNR), SNR, 'linewidth', 2);
    hold on;
    lgd = legend('SQNR');
    set (lgd, "fontsize", 12)
    title('Iteration vs SQNR','fontweight','bold','fontsize',16);
    xlabel('Iteration','fontweight','bold','fontsize',14)
    ylabel('SQNR','fontweight','bold','fontsize',14)
    grid
    hold off
    
end