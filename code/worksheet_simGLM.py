# simulate from a GLM
T = 1000; #just 1000 time points, try increasing this if you'd like
x = np.random.normal(0,1,(T)) #white noise stimulus
y = np.zeros((T)) #pre-allocate some space to put the spikes

for t in range(3,T): # start from time 3, because we need y[t-3]
    y[t] = np.random.poisson(np.exp(-5*y[t-1] - 1.5*y[t-2] - 0.1*y[t-3] + 0.3*x[t]-3))
    
# form a design matrix for glm
Y = y[3:T]
X = np.array([y[2:T-1], y[1:T-2], y[:T-3], x[3:], np.ones(T-3)]).T
# weights = sm.GLM(?, ?, ?)? % TODO