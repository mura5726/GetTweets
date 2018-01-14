install.packages("RMeCab", repos = "http://rmecab.jp/R")
library(RMeCab)
RMeCabC.result <-RMeCabC("形態素解析は文を単語単位に分割する技術です。")
unlist(RMeCabC.result)


##英文
install.packages(c("openNLP","NLP","purrr","magrittr"), dependencies = T)
install.packages("rJava")
library(rJava)
library(openNLP)
library(NLP)
library(purrr)
library(magrittr)

#text for analysis
text = "R is free software environment fore statistical computing and graphics"
text = as.String(text)

#品詞情報を付与
sent_token_annotator = Maxent_Sent_Token_Annotator()
Word_token_annotator = Maxent_Word_Token_Annotator()
text_an = annotate(text, list(sent_token_annotator, Word_token_annotator))
pos_tag_annotator = Maxent_POS_Tag_Annotator()
text_an2 = annotate(text, pos_tag_annotator, text_an)

#品詞情報付与結果を整形
text_an3 = subset(text_an2, type == "word")
tags = map_chr(text_an3$features, extract(1))
sprintf("%s: %s", text[text_an3], tags)


