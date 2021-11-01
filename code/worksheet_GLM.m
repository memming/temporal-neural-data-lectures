%% Do the Poisson regression
tic;
[b, dev, stats] = glmfit(X, Y, 'Poisson', 'link', 'log');
fprintf('it took [%g sec] to fit the GLM\n', toc);
% deviance is -2 times log-likelihood + constant
fprintf('GLM deviance: [%g]\n', dev);
lambdaDelta = glmval(b, X, 'log'); % predicted firing rate (per bin)

%% Single-lagged covariate example
lag = 14;
[b, dev] = glmfit(x(1:end-lag), y(1+lag:end), 'Poisson', 'link', 'log');
lambdaDelta = glmval(b, x(1:end-lag), 'log');