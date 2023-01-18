import statsmodels.api as sm
log_link = sm.families.links.Log()
poisson_log = sm.GLM(Y, X, family=sm.families.Poisson(log_link))
poisson_log_results = poisson_log.fit()
poisson_log_results.summary()
