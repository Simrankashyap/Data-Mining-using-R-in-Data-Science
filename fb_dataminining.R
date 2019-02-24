#Data Mining From FB
install.packages("Rfacebook") #Package 
install.packages("RCurl")
library(Rfacebook)
library("RCurl")
fb_auth= fbOAuth(app_id="XXXX",app_secret="XXXX",extended_permissions = TRUE)
m=getUsers("me",fb_auth,private_info = TRUE)
like=getLikes(user = "me",token= fb_auth)
sample(like$names,10)
updateStatus("R is easy",token= fb_auth)       
page=getPage(page = "BBC",token= fb_auth,n=10)
class(page)
head(page$names)
names(page)
page[,"message"]
page$likes_count
max(page$likes_count)
?which.max
a=which.max[summary]
page=getPage(page="Google",token= fb_auth,n=5)
page$messages
summary=page[which.max(page$likes_count)]
page
a=summary
a=as.vector(summary[,1])
class(summary)
class(a)
which.max(summary[,1])
page$message[which.max(summary[,1])]
page$message[which.max(summary$like_counts)]
a
b=which.min(a)
b
page$message[b]
summary$message
post=getPost(page$id[1],token=fb_auth,n.comments=10,likes=T)
comments=post$comments
comments$comments_count
??getpost
token1="XXXX"
my_friends<-getFriends(token1,simplify = FALSE)
View(my_friends)
my_friends$gender
comments
myfriends=getFriends(fb_auth,simplify=T)

