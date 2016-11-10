rm(list=ls())
if(grepl('spencerfox', Sys.info()['login'])) {
  setwd('~/projects/workshops/rstats_fall2016/files/9_tacc_r/code/')
}
if(grepl('sjf826', Sys.info()['login'])) {
  setwd('/home1/02958/sjf826/9_tacc_r/code/')
}
if(grepl('eac3496', Sys.info()['login'])) {
  setwd('/home1/03123/eac3496/9_tacc_r/code/')
}

## First give list of parameter values you want to explore
inf_probs <- seq(0, 0.5, length.out = 10)
rec_rates <- c(1/100, 1/10, 1)

sink('../launcher/run_sim_epis.txt')
for(inf_prob in inf_probs){
  for(rec_rate in rec_rates){
    startCmd <- "R CMD BATCH '--args"
    paramCmd <- paste0(' inf_prob=', inf_prob, ' rec_rate=', rec_rate, " '")
    endCmd <- " ../code/sim_epidemics.R"
    full_cmd <- paste0(startCmd, paramCmd, endCmd)
    cat(full_cmd)
    cat('\n')
  }
}
sink()
  
