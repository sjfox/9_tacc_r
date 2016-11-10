###########################################
## Script w/ functions
## to simulate stochastic epidemics
## For use on TACC
###########################################
if(grepl('spencerfox', Sys.info()['login'])) setwd('~/projects/workshops/rstats_fall2016/files/9_tacc_r/code/')
if(grepl('sjf826', Sys.info()['login'])) setwd('/home1/02958/sjf826/9_tacc_r/code/')
if(grepl('tacc', Sys.info()['nodename'])) setwd('/home1/02958/sjf826/9_tacc_r/code/')

## Need to call model with following parameters:
# inf_prob, rec_rate

args <- (commandArgs(TRUE)) ## load arguments from R CMD BATCH

## Needs 
if(length(args)>0)  { ## Then cycle through each element of the list and evaluate the expressions.
  print(paste0('loading in ', args, ' from R CMD BATCH'))
  for(i in 1:length(args)) {
    eval(parse(text=args[[i]]))
  }
}

library(EpiModel)

param <- param.icm(inf.prob = inf_prob, rec.rate = rec_rate)
init <- init.icm(s.num = 1000, i.num = 5, r.num=0)
control <- control.icm(type = "SIR", nsims = 1000, nsteps = 300)
mod <- icm(param, init, control)


save(list = c("mod"), 
          file = paste0("../../workfolder/data/simulated_epidemics/", "epi_", inf_prob, "_", rec_rate, "_", nsims, ".Rdata"))