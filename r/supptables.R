supptable_main <- function(class, type, model, title, outpath, footnote=""){
  
  if(class=="linear"){
    stat <- md("*t*")
  } else if (class=="logistic"){
    stat <- md("*z*")
  } else {
    stop("ERROR: Model must be of class c('linear', 'logistic'.")
  }
  
  if(type=="mixed"){
    mdl <- broom.mixed::tidy(model) %>%
      filter(effect=="fixed")
  } else if(type=="simple"){
    mdl <- broom::tidy(model)
  }else {
    stop("ERROR: Model must be of type c('mixed', 'simple'.")
  }
  

  mdl <- mdl %>%
    select(c(term, estimate, std.error, statistic, p.value))
  
  mdl$p.value <- gtsummary::style_pvalue(mdl$p.value)
  
  mdl %>%
    gt() %>%
    tab_header(
      title = md(title),
      subtitle = md("_Main Model_")
    ) %>%
    cols_label(
      term = md(""),
      estimate = md("*β*"),
      std.error = md("SE"),
      statistic = stat,
      p.value = md("*p*")
    ) %>%
    cols_align(
      align = "right"
    ) %>%
    fmt_number(columns=c(estimate, std.error, statistic), decimals=4) %>%
    tab_footnote(footnote=footnote) %>%
    gt::gtsave(filename = paste(outpath, "_", today, ".png", sep="", collapse=NULL))

}


supptable_pair <- function(class, contrast, title, outpath, footnote=""){
  
  if(class=="linear"){
    stat <- md("*t*")
  } else if (class=="logistic"){
    stat <- md("*z*")
  } else {
    stop("ERROR: Model must be of class c('linear', 'logistic'.")
  }
  
  cont <- summary(contrast)
  
  names(cont)[names(cont)=='t.ratio'|names(cont)=='z.ratio'] <- 'statistic'
  
  cont$p.value <- gtsummary::style_pvalue(cont$p.value)
  
  cont %>%
    gt() %>%
    cols_hide(df) %>%
    tab_header(
      title = md(title),
      subtitle = md("_Tukey-adjusted Pairwise Contrasts_")
    ) %>%
    cols_label(
      contrast = md(""),
      estimate = md("*β*"),
      SE = md("SE"),
      statistic = stat,
      p.value = md("*p*")
    ) %>%
    cols_align(
      align = "right"
    ) %>%
    fmt_number(columns=c(estimate, SE, statistic), decimals=4) %>%
    tab_footnote(footnote=footnote) %>%
    gt::gtsave(filename = paste(outpath, "_", today, ".png", sep="", collapse=NULL))
  
}