% Nicoleilus BMI data
load('monkey_be0413_spkTimes.mat');

%%
s = whos('-regexp', 'sig*');
M = length(s);
T = size(Pr,1);
Fs = 200;

%%
neuronIdx = [58    43    94    44    85   103    30    88    46   105    93   104    27    35    75];
neuronIdx = 94;
M = numel(neuronIdx);
%T = min(T, 10000000);
y = zeros(T, M);

%%
for kIdx = 1:M
    k = neuronIdx(kIdx);
    fprintf('.');
    st = eval(s(k).name);
    if isempty(st)
    	fprintf('%d is an empty spike train!\n');
        continue
    else
        for kSpk = 1:numel(st)
            tt = st(kSpk)*Fs;
            if tt > T
                continue;
            end
            y(ceil(tt), kIdx) = 1;
        end
    end
end
fprintf('\n');

%%
mFR = sum(y);
[~, sidx] = sort(mFR, 'descend');
yidx = mFR > median(mFR);
nnz(yidx)

%%
clf
imagesc(y(1*1000+(1:100000), yidx)');
hold on;
plot(sum(y))

%%
clf
maxLags = 100;
[ac, lags] = xcorr(y(:, 1) - mean(y(:, 1)), maxLags);
plot(lags, ac);

%%
maxLags = 1000;
clf;
for kNeuron = 1
    subplot(1,1,kNeuron); hold all;
    yy = y(:, kNeuron) - mean(y(:, kNeuron));
    for kDim = 1:3
        [xc, lags] = xcorr(yy, Pr(1:T, kDim), 'coeff', maxLags);
        plot(lags, xc)
    end
    for kDim = 1:3
        [xc, lags] = xcorr(yy, [0; diff(Pr(1:T, kDim))], 'coeff', maxLags);
        plot(lags, xc)
    end
    grid on;
end
legend

%%
x = Pr;
x = x - mean(x);

%%
save('mysterious_monkey_data.mat', 'x', 'y')