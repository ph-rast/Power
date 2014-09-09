##         Title: Power to detect change
##    Created at: 09-12.2012
## Last modified: 25-09-2013
##        Author: Philippe Rast <prast@uvic.ca>
##
##      Citation: Rast, P., & Hofer, S. M. (2014). Longitudinal design considerations to
##                optimize power to detect variances and covariances among rates of change:
##                Simulation results based on actual longitudinal studies.
##                Psychological Methods, 19(1), 133–154. doi:10.1037/a0034524
##
##  Requirements: Following packages are needed:
##                'OpenMx' (>= version 1.2.3) cf. http://openmx.psyc.virginia.edu/
##                'snowfall' for parallel computing
## ---------------------------------------------------------------------- ##

##----------------------------------------##
## Provide population parameters          ##
##----------------------------------------##

## Data from OCTO: MIR BLK Unstandardized
## Waves / measurement occasions.
# Provide Vecotor with actual time scale.
Ws <- c(0, 2.06, 4.07, 6.04, 8.03) # Eg., scale in Years

## Factor means
#       mean(I1) mean(S1) mean(I2) mean(S2)
mu <- c(12.037,	  -0.466,   6.539,  -0.248)

## Factor variances
#            var(I1)   var(S1)   var(I2)  var(S2)
sigdiag <- c(39.139,	0.257,	  4.320,   0.124)

## Factor covariances
## Format is: I1S1, I1I2, I1S2, S1I2, S1S2, I2S2
#               I1S1     I1I2    I1S2    S1I2    S1S2    I2S2
obs.covs <- c(-0.457,	6.006,	0.573,	0.219,	0.116,	0.132)

## Residual (co)-variances
resvar1=10.65 # residual variance variable 1
resvar2=2.047 # residual variance variable 2
rescov=0.629  # covariance

## All population values have been provided ##
##------------------------------------------##

## Parameters to be varied

## Set of different sample sizes are defined in Ns:
Ns=c(50, 100)

## Correlation among slopes:
r <- obs.covs[5]/sqrt(sigdiag[2]*sigdiag[4]) # S1S2 correlates to 0.65

## OR, set slope correlations to a range of values 
r=c(.3, .5)

## Number of replications in Monte Carlo simulatoin (start low, openMx is slow):
nReps <- 500 # Number of replications 

## Number of CPUs available for parallel computing, newer desktop PC will have between 4 and 8
nCPUS <- 8

## Truncate numerical precision of observed covariance matrix. OpenMx can be very picky about it.
## Precision is defined by amount of decimal places 'decPl'
decPl=12

## Call simulation:
## This source may be placed in loops to obtain variations over different parameters
## Load MCsimu.R 
source('./MCsimu.R')

## Note, don't worry about warning messages of this type:
# Warning messages:
# 1: In library(package = "OpenMx", character.only = TRUE, pos = 2, warn.conflicts = TRUE,  :
#   'keep.source' is deprecated and will be ignored



## show results
# N=Sample size
# PowerS1S2 
# N = Sample size
# PS1S2W       = Power from Wald statistic for covariance among slopes
# PS1S2LR      = Power from LR statistic for covariance among slopes
# coverageS1S2 = Coverage rate for covariance
# PS1W         = Power from Wald statistic for slope 1 variance
# PS1LR        = Power from LR statistic for slope 1 variance
# coverageS1   = Coverage for slope 1 variance
# PS2W         = Power from Wald statistic for slope 2 variance
# PS2LR        = Power from LR statistic for slope 2 variance
# coverageS2   = Coverage for slope 2 variance
# validSamp    = Valid samples power estimates are based on
# r            = Correlation among slopes
mcResults


