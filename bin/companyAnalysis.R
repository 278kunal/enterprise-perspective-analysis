n<-commandArgs(TRUE)
setwd("bin")
library(dplyr)
library(ggplot2)
library(twitteR)
if(file.exists("output_company_analysis.txt")){
  unlink("output_company_analysis.txt")
}
if(file.exists("plot2.png")){
  unlink("plot2.png")
}
sample1<-n[1]
setup_twitter_oauth("pIDIwlJo22AdNNhATRRe4WhX5","ac7s1rYfmFt57SY9qs0lP4kUDEAL0uiPNs0Dm8wLzFXSur8TcN","129278106-RbginBuAYIihlt76EaBJje7WPhZIb9DoCgiASEiH","lxOKFv2rqv71tFESFaqfZPpNjBAtSBguIdsyKZGUApQsH")
goog<-searchTwitter("google", n="10", retryOnRateLimit = 1)
goog<-twListToDF(goog)
goog_d<-goog$created
micr<-searchTwitter("microsoft",since ="2015-05-01", n="10", retryOnRateLimit = 1)
micr_d<-twListToDF(micr)
micr_d<-micr_d$created
mix_d<-c(micr_d,goog_d)
fact<-gl(2,10,20,label=c("Microsoft","Google"))
df<-data.frame(data=mix_d,fact=fact)
df<-arrange(df,data)
temp<-integer(0)
num<-df$data
temp[1]<-1
prev<-num[1]
initital<-1
loc<-1
for(i in 2:length(num))
  {
    if(num[i]>prev)
    {
      temp[loc+1]<- initital+1
      initital<-initital+1
    }
    else
      temp[loc+1]<- initital
    loc<-loc+1
    prev<-num[i]
}
win<-character(0)
df$temp<-temp
tm<-table(df$data[df$fact=="Microsoft"])
tm<-as.data.frame(tm)
tm<-cbind(tm,fact=rep("Microsoft",length(tm$Var1)))
tg<-table(df$data[df$fact=="Google"])
tg<-as.data.frame(tg)
tg<-cbind(tg,fact=rep("Google",length(tg$Var1)))
finaldata<-rbind(tm,tg)
finaldata$Var1<-as.POSIXct(as.character(finaldata$Var1))
t<-tapply(df$temp,df$fact,sum)
if(t["Microsoft"]>t["Google"])
  {
win<-"Microsoft"
  }else if(t["Microsoft"]<t["Google"])
  {
  win<-"Google"
  }else
  {
  win<-"There is a tie"
  }

sink("output_company_analysis.txt")
cat(win)
sink()
png("plot2.png",height=480,width=480,units="px")
with(finaldata, plot(Var1,Freq,type="n",main="Trending Company",ylab="Number of tweets",xlab="Time(s:ms)"))
with(subset(finaldata,fact=="Google"),lines(Var1,Freq,col="Blue",type="l"))
with(subset(finaldata,fact=="Microsoft"),lines(Var1,Freq,col="Red",type="l"))
legend("topright",lty=1,legend=c("Microsoft","Google"),col=c("Red","Blue"))
dev.off()