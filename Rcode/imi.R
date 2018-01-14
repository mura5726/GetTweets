install.packages(c("tm", "stringer"), dependencies = T)
library(tm)
library(stringr)
Obama <- scan(file.choose(), what = "char", quiet = T)
# head(Obama)

Obama.lower = str_to_lower(Obama)
Obama.cleaned = removePunctuation(Obama.lower)
# head(Obama.cleaned)

#評判判定
install.packages(c("tidytext", "dplyr"), dependencies = T) 
