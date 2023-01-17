T = 2000; maxLags = 100; a1 = 0.83;
x = np.random.normal(0,1,(T))
y = np.random.normal(0,1,(T))
for t in range(3, len(y)-1):
    y[t+1] += a1 * y[t] + x[t-3]  # AR(1)

fig, ax = plt.subplots(figsize=(15,5), nrows=1, ncols=3)

xc = np.correlate(x, y, "full")[len(x)-maxLags:len(x)+maxLags+1]; 

ax[0].plot(np.arange(-maxLags, maxLags+1), xc)
ax[0].set_ylabel('raw cross correlation')
ax[0].set_xlabel('lags')