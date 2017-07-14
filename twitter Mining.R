#Twitter Mining using R
install.packages("twitteR")
consumer_key <- 'XXXX'
consumer_secret <- 'XXXX'
access_token<-'XXXX'
access_secret <- 'XXXX'
library(twitteR)
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
#Fetching Tweets
library(twitteR)
tweet1 = searchTwitter("Hilary Clinton",n=10,lang="en", resultType = "old")
tweet1
#Cleaning Twitter Data        #Web Scrapping
tweet_data.text = sapply(tweet1,function(x) x$getText())
tweet_data.text
#Remove Retweet
x = gsub("RT"," ",tweet_data.text)
x
#Remove @
x = gsub("@\\w+"," ",x)
x
#Remove Puntuation
x=gsub("\\W"," ",x)
x
#Remove Digit
x=gsub("\\d"," ",x)
x
#Remove Links
x = gsub("http\\w+"," ",x)
x
#Remove Tabs
x = gsub("[|\t]{2,}"," ",x)
x
#Remove Blank Space at the beginning
x = gsub("^"," ",x)
x
#Remove Blank Space at the End
x = gsub("$"," ",x)
x
#Convert to Lower
x = tolower(x)
x
#Removing Certain Words(StopWords)
#stopwords()
library(tm)
y = removeWords(x,c('US election',stopwords()))
y

y = stripWhitespace(y)
print(y)
#Convert to Corpus
tweet_corpus = Corpus(VectorSource(y))
tweet_corpus
#Convert Corpus to Plain Text Document
tweet_corpus = tm_map(tweet_corpus,PlainTextDocument)
#Stemming Document
tweet_corpus = tm_map(tweet_corpus,stemDocument)
library(wordcloud)
wordcloud(y, random.order=FALSE,min.freq = 0.1)
#Perform Sentiment Analysis
install.packages("RSentiment")
library(RSentiment)
calculate_score(y)
calculate_sentiment(y)
calculate_total_presence_sentiment(y)
#Sentiment Analysis
sentiment = get_nrc_sentiment(y)
sentiment
z = cbind(y,sentiment)
z
#Count Sentiment Words by Category
TotalSentiment = data.frame(colSums(z[,c(2:11)]))
names(TotalSentiment) = "Count"
TotalSentiment
TotalSentiment = cbind("Sentiment"=rownames(TotalSentiment), TotalSentiment)
TotalSentiment
rownames(TotalSentiment) = NULL
TotalSentiment
#Plot the Sentiment Words
barplot(TotalSentiment$Count, names.arg = TotalSentiment$Sentiment,xlab = "Sentiment", ylab="Total Count", main = "Total Sentiment Score", col = rainbow(11))
