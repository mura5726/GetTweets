#ローカルからopenNLPmodesをインストール
# install.packages(pkgs = file.choose(), repos = NULL, type = "source")

library(rJava)
library(openNLP)
library(NLP)
library(purrr)
library(magrittr)

s = "R is a free software environment for statistical computing and graphics."
s = as.String(s)
sent_token_annotator = Maxent_Sent_Token_Annotator()
word_token_annotator = Maxent_Word_Token_Annotator()

a2 = annotate(s, list(sent_token_annotator, word_token_annotator))
parse_annotator = Parse_Annotator()  
p = parse_annotator(s, a2)
ptexts = map_chr(p$feature, extract(1))
ptexts

#tree
ptrees = lapply(ptexts, Tree_parse)
ptrees
