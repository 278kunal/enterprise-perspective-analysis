args <- commandArgs(TRUE)
word1 <- args[1]
word2 <- args[2]
library('twitteR')
consumer_key <- 'cH7NFzUzNiIOpdpWlxj4rWbKb'
consumer_secret <- 'uUSjYAPCcZcrtsceeUhcucPWI8whykaJlygJy9R69O7foibnf3'
access_token <- '2578016490-brR6eHTbcN3eyJo9G8UFkdS1YUvCqRHfeUsiH1l'
access_secret <- 'JuMbOXrdubpGryu3ZMAG3e2Fj1Jr4sZwEl9pcwj5rRQ8x'
setup_twitter_oauth(consumer_key,consumer_secret, access_token , access_secret)
file.create("results1.csv")
tw1 <- searchTwitter(word1,n=2000)
twdf1 <- twListToDF(tw1)
write.csv(twdf1,file="results1.csv")
file.create("results2.csv")
tw2 <- searchTwitter(word2,n=2000)
twdf2 <- twListToDF(tw2)
write.csv(twdf2,file="results2.csv")
