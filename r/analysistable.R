# Description: single function
# Inputs:
#  - modelsum: summary of a regression model [(g)lm, (g)lmer]
#  - contrasts: list of emmeans contrasts
#  - tables: list of dataframes/tibbles
#  - tabnames: vector of names associated with 'tables'
#  - outpath: outpath for multi-tab xlsx file
# Output:
#  - single xlsx file with one sheet for the model summary, one sheet for each contrast specified,
#    and one sheet for each table (named in accordance with tabnames)
# Author: Jessica M. Alexander
# Last Updated: 2025-05-22

analysistable <- function(modelsum, contrasts, tables, tabnames, outpath){
  
  if(length(tables)!=length(tabnames)){
    stop("ERROR: List of tables and vector of table numbers must be of the same length.")
  }
  
  wb <- openxlsx::createWorkbook()
  
  addWorksheet(wb, sheetName="model-summary")
  openxlsx::writeData(wb, sheet="model-summary", modelsum$coefficients, rowNames=TRUE)
  
  for(i in 1:length(contrasts)){
    em <- unlist(contrasts[i])
    preds <- em$emmeans@roles$predictors
    if(length(preds)==1){
      name <- paste("emmeans-", preds[1], sep="")
    } else if(length(preds)==2){
      name <- paste("emmeans-", preds[1], "|", preds[2], sep="")
    } else if(length(preds)==3){
      name <- paste("emmeans-", preds[1], "|", preds[2], "|", preds[3], sep="")
    } else {
      stop("ERROR: Function only handles up to three predictors.")
    }
    addWorksheet(wb, sheetName=name)
    openxlsx::writeData(wb, sheet=name, em$contrasts, rowNames=TRUE)
  }
  
  for(j in 1:length(tables)){
    t <- tables[j][[1]]
    addWorksheet(wb, sheetName=tabnames[j])
    openxlsx::writeData(wb, sheet=tabnames[j], t)
  }
  
  openxlsx::saveWorkbook(wb, paste(outpath, "_", today, ".xlsx", sep="", collapse=NULL))

}