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
library(tidytext)
library(dplyr)

#ポジティブな言葉を抽出する
positive = filter(get_sentiments("nrc"), sentiment == "positive")
Obama.positive = Obama.cleaned %in% positive$word #データの重なりをチェック
Obama.positive.2 = grep("TRUE", Obama.cleaned %in% positive$word) #grepで位置を確認
length(Obama.positive.2)
Obama.cleaned[Obama.positive]

#ネガティブな言葉を抽出する
negative = filter(get_sentiments("nrc"), sentiment == "negative")
Obama.negative = Obama.cleaned %in% negative$word #データの重なりをチェック
Obama.negative.2 = grep("TRUE", Obama.cleaned %in% negative$word) #grepで位置を確認
length(Obama.negative.2)
Obama.cleaned[Obama.negative]

#sentence
#install package
install.packages("devtools", dependencies = T)
devtools::install_github("sfeuerriegel/SentimentAnalysis")
library(SentimentAnalysis)
library(NLP)
Obama.2 = scan("C:/Users/mura5/Documents/GetTweets/SJIS_20170621/Data/Obama.txt",what = "char", sep = "\n", quiet = T)
sentiment = analyzeSentiment(Obama.2)
convertToDirection(sentiment$SentimentGI)
table(convertToDirection(sentiment$SentimentGI))

#日本語で評判分析を行うためのパッケージは存在しない？？？