%% simulate from a GLM
T = 1000; % just 1000 time points, try increasing this if you'd like
x = randn(T, 1); % white noise stimulus
y = zeros(T, 1); % pre-allocate some space to put the spikes
for t = 4:T % start from time 4, because we need y(t-3)
    y(t) = poissrnd(exp(-5*y(t-1) - 1.5*y(t-2) - 0.1*y(t-3) + 0.3*x(t)-3));
end
%% form a design matrix for glmfit
Y = y(4:T);
X = [y(1:T-3), y(2:T-2), y(3:T-1), x(4:T)];
weights = glmfit(?, ?, ?, ?) % TODO
