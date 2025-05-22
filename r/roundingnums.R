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