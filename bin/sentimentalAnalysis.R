n<-commandArgs(TRUE)
setwd("bin")
library(twitteR)
library(ggplot2)
sample<-n[1]
file <- n[2]
op <- n[3]
if(file.exists(op)){
  unlink(op)
}
if(file.exists(file)){
  unlink(file)
}
setup_twitter_oauth("pIDIwlJo22AdNNhATRRe4WhX5","ac7s1rYfmFt57SY9qs0lP4kUDEAL0uiPNs0Dm8wLzFXSur8TcN","129278106-RbginBuAYIihlt76EaBJje7WPhZIb9DoCgiASEiH","lxOKFv2rqv71tFESFaqfZPpNjBAtSBguIdsyKZGUApQsH")
sentiment <- function(sample,file,op) {
		goog<-searchTwitter(sample, n="50", retryOnRateLimit = 1, lang="en")
		goog<-twListToDF(goog)
		text<-goog$text
		positive<-read.table("positive.txt")
		negative<-read.table("negative.txt") 
		postweets<-0
		negtweets<-0
		neutraltweets<-0
		for(i in 1:length(text))
		  {
		  text[i]<-gsub("@\\w+"," ",text[i])
		  text[i]<- gsub("(RT|via)((?:\\b\\W*@\\w+)+)", " ",text[i])
		  text[i]<-gsub("http(s)?://\\w+"," ",text[i])
		  # text[i]<-gsub("[[:punct:]]+"," ",text[i])
		  text[i]<-gsub("[^[:alnum:][:space:]-]"," ",text[i])
		  text[i]<-gsub("[[:digit:]]+"," ",text[i])
		  text[i]<-gsub("\\s{2,}"," ",text[i])
		  words<-strsplit(text[i]," ")
		  len<-length(words[[1]])
		  neg<-0
		  pos<-0
		  for(j in 1:len)
		  {
		    p<-sum(words[[1]][j]==positive$V1)
		    if(p>0)
		    {
		      pos<-pos+1
		    }
		    else
		    {
		      n<-sum(words[[1]][j]==negative$V1)
		      if(n>0)
		      {
		        neg<-neg+1
		      }
		    }
		  }
		    if(pos>neg) {postweets<-postweets+1}
		    else if(neg>pos) {negtweets<-negtweets+1}
		    else neutraltweets<-{neutraltweets+1}
		  }
		sink(op)
		cat("Positive Tweets: ",postweets,"\nNeutral Tweets: ",neutraltweets,"\nNegative Tweets: ",negtweets)
		sink()
		tab<-data.frame(name=c("Positive","Neutral","Negative"),values=c(postweets,neutraltweets,negtweets))
		png(file,height=480,width=480,units="px")
		plot<-ggplot(tab,aes(factor(name),values))+geom_bar(stat="identity",aes(fill=factor(name)))
		plot<-plot+xlab("Company Sentiment")+ylab("Number of tweets")+ggtitle("Sentimental Analysis")
		print(plot)
		dev.off()
	}
sentiment(sample,file,op)	
