T = 2000; maxLags = 100; a1 = 0.83;
x = randn(T, 1); y = randn(T, 1);
for t = 4:numel(y)-1
    y(t+1) = a1 * y(t) + x(t-3) + y(t+1); % AR(1)
end

figure(333); clf; subplot(3,1,1)
[xc, lags] = xcorr(x, y, maxLags); % raw cross correlation
plot(lags, xc)
ylabel('raw cross correlation'); grid on;

subplot(3,1,2); hold all;
[xc, lags] = xcorr(x, y, maxLags, 'unbiased'); % normalize with 1/(1-m-tau)
plot(lags, xc)
[xc, lags] = xcorr(x, y, maxLags, 'coeff'); % normalize to corr coefficient
plot(lags, xc)
legend('unbiased', 'coeff');

subplot(3,1,3); hold all;
[ac, lags] = xcorr(x, maxLags, 'coeff'); % compute autocorrelation function
plot(lags, ac);
[ac, lags] = xcorr(y, maxLags, 'coeff'); % autocorrelation for y
plot(lags, ac);
xlabel('lags'); legend('x', 'y'); ylabel('autocorrelation');
