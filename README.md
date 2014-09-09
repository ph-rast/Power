Power to Detect Rates of Change 
===============================

*R scripts to estimate power to detect individual differences in slopes and covariance among slopes in bivariate LGCM*

Two files are used to simulate power in a LGC model. The first file (popval.R) contains population values and sources the second 
file (MCsimu.R) which runs the Monte Carlo simulation. A user would only need to modify the parameters in popval.R.

Note that the libraries OpenMx (at least version 1.2.3) and snowfall are required. OpenMx is used to set up and test the LGC model and snowfall is used for parallel computing, i.e., to make use of  some or all cpu cores on your computer. 
This script provides power based on the Wald and LR test statistics. 

This code has been tested with OpenMx versions up to 1.4-3532.


In case of use, please cite: 
Rast, P., & Hofer, S. M. (2014). Longitudinal design considerations to optimize power to detect variances and covariances among rates of change: Simulation results based on actual longitudinal studies. *Psychological Methods, 19*, 133–154. doi:10.1037/a0034524
