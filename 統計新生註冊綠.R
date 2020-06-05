install.packages("magrittr")
install.packages("dplyr")
library(magrittr)
library(dplyr)
R.Version()
rm(list=ls()) #刪除所有變數
filename='學12-1.新生註冊率-以「系(所)」統計.csv'
x=read.csv(filename)
fields=c('學年度','設立別','學校類別','學校代碼','學校名稱','系所代碼','系所名稱','日間/進修','學制班別','新生招生名額(A)','新生保留入學(B)','實際註冊人數(C)','新生註冊率','系所特色','網站')
names(x)=fields
head(x)
#新增1短校名欄位
x=subset(x,學制班別=='學士班(含四技)')
y=as.data.frame(append(x, list(短校名=x$學校名稱), after=5))
y$短校名
# https://regex101.com/
# https://regexr.com/
y$短校名=gsub(".*學校財團法人","",y$短校名)
y$短校名=gsub("科技大學","科大",y$短校名)
y$短校名=gsub("國立臺北護理健康大學","國立北護",y$短校名)
y$短校名=gsub("國立臺北商業大學","國立北商",y$短校名)
#y$短校名=gsub("技術學院","",y$短校名)
y[y$新生註冊率<60,c(6,14)]
y[y$新生註冊率<60,c('短校名','新生註冊率')]
subset(y,新生註冊率<60,select=c('短校名','新生註冊率'))
z=y %>% filter(新生註冊率<60) %>% select(短校名,新生註冊率)

