# Description: pair of functions
# Functions:
#  - supptable_main: formatted table of main regression model summary
#  - supptable_pair: formatted table of pairwise contrasts from a regression model
# Inputs:
#  - class: either 'linear' or 'logistic'
#  - type: either 'mixed' ((g)lmer) or 'simple' ((g)lm)
#  - model: a regression model object [(g)lm, (g)lmerMod]
#  - contrast: specific emmeans pairwise contrast
#  - title: text of the table title (use: "**title**")
#  - outpath: outpath for .png image of formatted table
#  - footnote: text of any string to include as a footnote to the table
# Author: Jessica M. Alexander
# Last Updated: 2025-05-22

supptable_hsd <- function(hsd, title, outpath, footnote=""){
  
  hsd <- select(tukey_val, c(contrast, estimate, conf.low, conf.high, adj.p.value))
  hsd$adj.p.value <- gtsummary::style_pvalue(hsd$adj.p.value)
  
  hsd %>%
    gt() %>%
    tab_header(
      title = md(title),
      subtitle = md("_Posthoc Tukey HSD Contrasts_")
    ) %>%
    cols_align(
      align = "right"
    ) %>%
    fmt_number(columns=c(estimate, conf.low, conf.high), decimals=4) %>%
    tab_footnote(footnote=footnote) %>%
    gt::gtsave(filename = paste(outpath, "_", today, ".png", sep="", collapse=NULL))
  
}