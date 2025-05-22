# Description: group of functions
# Functions:
#  - digit_display: rounds small decimals to 4 digits, all others to 3
#  - tinyps: outputs '< 0.001' for p-values smaller , otherwise '= specific-p-value'
# Author: Jessica M. Alexander
# Last Updated: 2025-05-22

digit_display <- function(number){
  if(abs(number)<0.001){
    x <- sprintf("%.4f", number)
  }else{
    x <- sprintf("%.3f", number)
  }
  return (x)
}


tinyps <- function(pval){
  if(pval < 0.001){
    "< 0.001"
  }else {
    tmp <- round(pval,3)
    paste("= ", as.character(tmp), sep="", collapse=NULL)
  }
}