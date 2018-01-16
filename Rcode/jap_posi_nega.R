# install.packages("plotrix")aa
library(plotrix)

library (RMeCab)
# 単語感情極性表(Semantic Orientations of Words)を読み込みます
sowdic <- read.table("http://www.lr.pi.titech.ac.jp/~takamura/pubs/pn_ja.dic",sep=":",col.names=c("term","kana","pos","value"),colClasses=c("character","character","factor","numeric"),fileEncoding="Shift_JIS")
# 名詞＋品詞で複数の候補がある場合は平均値を採用します
sowdic2 <- aggregate(value~term+pos,sowdic,mean)
# ポジティブとネガティブを調整します(より傾向を出すため)
sowdic2$value <- sowdic2$value + 0.6
# 形態素解析の結果から頻度表を作成します
war2007 <- RMeCabFreq("C:/Users/mura5/Documents/GetTweets/SJIS_20170621/Data/jap_pn.txt")

# 単語感情極性表に含まれるものを抽出します
war2007 <- subset(war2007,Term %in% sowdic2$term)
# 単語感情極性表の属性をマージします
war2007 <- merge(war2007,sowdic2,by.x=c("Term","Info1"),by.y=c("term","pos"))
# キーワード毎にスコア算出します
score2007 <- war2007[4:(ncol(war2007)-1)]*war2007$value
# 描画用データを作成します
war2007 <-c(sum(score2007 > 0),sum(score2007 < 0))
# 描画用ラベルを作成します
lbls <- c("positive", "negative")
lbls <- paste(lbls, war2007, sep="：")
# 三次元円グラフを描画します
pie3D(war2007, radius=0.9, labels=lbls, explode=0.1, main="2007年 週報ネガポジ度")

