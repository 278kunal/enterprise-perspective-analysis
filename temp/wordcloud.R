args <- commandArgs(TRUE)
handle1 <- args[1]
handle2 <- args[2]
library('twitteR')
library('tm')
library('wordcloud')
consumer_key <- 'cH7NFzUzNiIOpdpWlxj4rWbKb'
consumer_secret <- 'uUSjYAPCcZcrtsceeUhcucPWI8whykaJlygJy9R69O7foibnf3'
access_token <- '2578016490-brR6eHTbcN3eyJo9G8UFkdS1YUvCqRHfeUsiH1l'
access_secret <- 'JuMbOXrdubpGryu3ZMAG3e2Fj1Jr4sZwEl9pcwj5rRQ8x'
setup_twitter_oauth(consumer_key,consumer_secret, access_token , access_secret)
wc1 <- function(handle1){
handle1_tweets <- searchTwitter(handle1,n=200,lang="en")
handle1_text <- sapply(handle1_tweets, function(x) x$getText())
handle1_text <- sapply(handle1_text,function(row) iconv(row, "latin1", "ASCII", sub=""))
handle1_corpus <- Corpus(VectorSource(handle1_text))
tdm1 = TermDocumentMatrix(handle1_corpus,control = list(removePunctuation = TRUE, stopwords = c(handle1, stopwords("english")),
   removeNumbers = TRUE, tolower = TRUE))
m1 = as.matrix(tdm1)
word_freqs1 = sort(rowSums(m1), decreasing=TRUE)
dm1 = data.frame(word=names(word_freqs1), freq=word_freqs1)
png("wordcloud1.png",width=400,height=400)
wordcloud(dm1$word, dm1$freq, min.freq = 1, max.words = Inf,rot.per = 0.15,scale = c(4,0.4),  random.order=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
}
wc2 <- function(handle2){
handle2_tweets <- searchTwitter(handle2,n=200,lang="en")
handle2_text <- sapply(handle2_tweets, function(x) x$getText())
handle2_text <- sapply(handle2_text,function(row) iconv(row, "latin1", "ASCII", sub=""))
handle2_corpus <- Corpus(VectorSource(handle2_text))
tdm2 = TermDocumentMatrix(handle2_corpus,control = list(removePunctuation = TRUE, stopwords = c(handle2, stopwords("english")),
   removeNumbers = TRUE, tolower = TRUE))
m2 = as.matrix(tdm2)
word_freqs2 = sort(rowSums(m2), decreasing=TRUE)
dm2 = data.frame(word=names(word_freqs2), freq=word_freqs2)
png("wordcloud2.png",width=400,height=400)
wordcloud(dm2$word, dm2$freq, min.freq = 1, max.words = Inf,rot.per = 0.15,scale = c(4,0.4),  random.order=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
}
wc1(handle1)
wc2(handle2)