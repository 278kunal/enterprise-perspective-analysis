args <- commandArgs(TRUE)
setwd("bin")
handle1 <- args[1]
wcfile1 <- args[2]
freqfile1 <- args[3]
table <- args[4]
library('twitteR')
library('tm')
library('wordcloud')
library('RMySQL');
consumer_key <- 'oQY1WJCHiLitI30VbAaOpIHxG'
consumer_secret <- 'QRqxOGL4ETnjRW6bbdU2ixt55N8mGN0DjvsiCjyPtMIj3qKIbX'
access_token <- '2578016490-brR6eHTbcN3eyJo9G8UFkdS1YUvCqRHfeUsiH1l'
access_secret <- 'JuMbOXrdubpGryu3ZMAG3e2Fj1Jr4sZwEl9pcwj5rRQ8x'
setup_twitter_oauth(consumer_key,consumer_secret, access_token , access_secret)

freq <- function(handle_text,freqfile) {
  docs <- Corpus(VectorSource(handle_text))
  toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
  docs <- tm_map(docs, toSpace, "/")
  docs <- tm_map(docs, toSpace, "@")
  docs <- tm_map(docs, toSpace, "\\|")
  docs <- tm_map(docs, content_transformer(tolower))
  docs <- tm_map(docs, removeNumbers)
  docs <- tm_map(docs, removeWords, stopwords("english"))
  docs <- tm_map(docs, removePunctuation)
  docs <- tm_map(docs, stripWhitespace)
  dtm <- TermDocumentMatrix(docs)
  m <- as.matrix(dtm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)
  fn <- freqfile
  if(file.exists(fn)) 
  file.remove(fn)
  png(filename = freqfile, width = 500, height = 500)
  barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
          col ="lightblue", main ="Most frequent words",
          ylab = "Word frequencies")
  dev.off()
}

tablewrite <- function(handle.df,table){
  con <- dbConnect(RMySQL::MySQL(),dbname="wordcloud", host="localhost",user="root",password="")
  handle.df<-head(handle.df,n=5)
  dbRemoveTable(con, table)
  dbWriteTable(con,table,handle.df,row.names=FALSE)
}

wc <- function(handle,wcfile,freqfile,table){
handle_tweets <- searchTwitter(handle,n=300,lang="en")
handle_text <- sapply(handle_tweets, function(x) x$getText())
handle_text <- sapply(handle_text,function(row) iconv(row, "latin1", "ASCII", sub=""))
handle.df <- twListToDF(handle_tweets)
tablewrite(handle.df,table)
freq(handle_text,freqfile)
handle_corpus <- Corpus(VectorSource(handle_text))
tdm = TermDocumentMatrix(handle_corpus,control = list(removePunctuation = TRUE, stopwords = c(handle, stopwords("english")),
   removeNumbers = TRUE, tolower = TRUE))
m = as.matrix(tdm)
word_freqs = sort(rowSums(m), decreasing=TRUE)
dm = data.frame(word=names(word_freqs), freq=word_freqs)
fn <- wcfile
if(file.exists(fn)) 
file.remove(fn)
png(wcfile,width=400,height=400)
wordcloud(dm$word, dm$freq, min.freq = 1, max.words = Inf,rot.per = 0.15,scale = c(4,0.4),  random.order=FALSE, colors=brewer.pal(8, "Dark2"))
dev.off()
}

wc(handle1,wcfile1,freqfile1,table)