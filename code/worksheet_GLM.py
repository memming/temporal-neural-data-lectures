import statsmodels.api as sm

log_link = sm.families.links.Log() #defines as the link function the logarithm

#initialize Poisson regression: 
poisson_log = sm.GLM(Y, X, family=sm.families.Poisson(log_link)) 

poisson_log_results = poisson_log.fit() #fit model 

poisson_log_results.summary() #get summary of fit
