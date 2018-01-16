# twitter R
#Consumer Key (API Key)	a9y1n7XHzqkaLDv5Rrhuomd8p
#Consumer Secret (API Secret)	0JFIPwZU7obsqL6BWUbVTJkNTRjCVdZl0pKyqcb70AQ8UHEWyc

# Access Token	123472435-8p9uXHRLSWbppJC1E9891Mmw8tAyZi4aFGclbMHZ
# Access Token Secret	gOYGtXyj0ieKvQdQLk4znapLPf4A5YY6KKagfOOQ44XT7


#Owner	mura_5726
#Owner ID	123472435

install.packages(c("twitteR", "bit64", "rjson", "DBI", "httr", "base64enc"), dependencies =  TRUE)
library(twitteR)

CONSUMERKEY = "a9y1n7XHzqkaLDv5Rrhuomd8p"
CONSUMERSECRET = "0JFIPwZU7obsqL6BWUbVTJkNTRjCVdZl0pKyqcb70AQ8UHEWyc"
ACCESSTOKEN = "123472435-8p9uXHRLSWbppJC1E9891Mmw8tAyZi4aFGclbMHZ"
ACCESSSECRET = "gOYGtXyj0ieKvQdQLk4znapLPf4A5YY6KKagfOOQ44XT7"

options(httr_oauth_cache = TRUE)
setup_twitter_oauth(CONSUMERKEY, CONSUMERSECRET, ACCESSTOKEN, ACCESSSECRET)

tweet_MMS = userTimeline("mura_5726", n = 10)
tweet_MMS

#キーワードを指定してツイートを抜き出す。
keyword = "修論"
keyword = iconv(keyword, to = "UTF-8")
search.results = twListToDF(searchTwitter(keyword, n = 1000))
search.results$text

#改行を削除
search.results.cleaned = gsub("\\n", " ", search.results$text, perl = T)
search.results.cleaned

#urlを削除
search.results.cleaned.2 = gsub("https?://[a-zA-Z0-9.-~_/%?=;&]+", "", search.results.cleaned, perl = T)
search.results.cleaned.2
