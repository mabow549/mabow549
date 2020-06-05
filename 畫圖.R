filename='學12-1.新生註冊率-以「系(所)」統計.csv'
x=read.csv(filename,fileEncoding = "utf8")
summary(x$當學年度新生註冊率...D..C..A.B...100.)
boxplot(x$當學年度新生註冊率...D..C..A.B...100.)
head(x[order(x$當學年度新生註冊率...D..C..A.B...100.),])