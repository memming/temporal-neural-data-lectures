sigma2 = 1;
aList = [0.9, 0.5, -0.1, -0.9];
w = linspace(0, pi, 255);

fig1 = figure(94); clf;

for k = 1:numel(aList)
    a = aList(k);
    psd = sigma2 ./ (1 - 2*a*cos(w) + a.^2);
    subplot(1,2,1); hold all;
    plot(w, psd ./ max(psd), 'LineWidth', 2)
    subplot(1,2,2); hold all;
    plot(w, 10*log10(psd), 'LineWidth', 2)
    lgdStr{k} = sprintf('a = %.1f', a);
end

subplot(1,2,1);
legend(lgdStr, 'Location', 'North')
xlabel('freq (rad)'); xlim([0, pi]); grid on;
ylabel('power (raw, normalized)');
set(gca, 'box', 'on');

subplot(1,2,2);
legend(lgdStr, 'Location', 'North')
xlabel('freq (rad)'); xlim([0, pi]); grid on;
ylabel('power (dB)');
set(gca, 'box', 'on');

set(gcf, 'PaperPosition', [0 0 10 4], 'PaperSize', [10 4]);
saveas(gcf, 'ar_psd.pdf');