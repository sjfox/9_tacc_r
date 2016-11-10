###########################################
## Script w/ functions
## to simulate stochastic epidemics
## For use on TACC
###########################################
if(grepl('spencerfox', Sys.info()['login'])) {
  setwd('~/projects/workshops/rstats_fall2016/files/9_tacc_r/code/')
  savepath <- "../data/simulated_epidemics/"
}
if(grepl('sjf826', Sys.info()['login'])) {
  setwd('/home1/02958/sjf826/9_tacc_r/code/')
  savepath <- "../../workfolder/data/simulated_epidemics/"
}
if(grepl('eac3496', Sys.info()['login'])) {
  setwd('/home1/03123/eac3496/9_tacc_r/code/')
  savepath <- "../../workfolder/epi_data/"
}


## Need to call model with following parameters:
# inf_prob, rec_rate
## Next lines are used to capture and evaluate the arguments from command R CMD BATCH

args <- (commandArgs(TRUE)) ## load arguments from R CMD BATCH

## Needs 
if(length(args)>0)  { ## Then cycle through each element of the list and evaluate the expressions.
  print(paste0('loading in ', args, ' from R CMD BATCH'))
  for(i in 1:length(args)) {
    eval(parse(text=args[[i]]))
  }
}

###################
## This part same as normal simulation
library(EpiModel)

control <- control.icm(type = "SIR", nsims = 10, nsteps = 300)
init <- init.icm(s.num = 9995, i.num = 5, r.num=0)

## This is where our command argument parameters come in play.
param <- param.icm(inf.prob = inf_prob, rec.rate = rec_rate)


mod <- icm(param, init, control)

save(list = c("mod"), 
          file = paste0(savepath, "epi_", inf_prob, "_", rec_rate, ".Rdata"))