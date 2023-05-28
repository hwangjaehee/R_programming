Kospi = read.csv("KOSPI_20230330.csv",fileEncoding="euc-kr")
Kospi
data.frame(Kospi)
str(Kospi) #data.frame 형태
View(Kospi)

install.packages("readxl")
library(readxl)

Kosdaq = read_excel("KOSDAQ_20230330.xlsx",sheet=1)
Kosdaq #tibble로 받아들임
View(Kosdaq)

names(Kospi) #한줄에 여러개가 나오더라도 앞에 있는 숫자는 index를 의미
dim(Kospi) #몇행 몇열
head(Kospi,8)
tail(Kospi,3)

data1 = read.csv("학교급별_사교육비_총액_20230331094131.csv",fileEncoding="euc-kr")
View(data1)
head(data1,10)
str(data1)

Kospi$등락률
Kospi[,c("지수명","등락률"),drop=F]
Kospi[,"등락률",drop=F]
Kospi[,]
Kospi[,1:3]
Kospi[,1]
Kospi[,]
Kospi[1,]
Kospi[c(-1:-46),]
Kospi[3,4,drop=F]
Kospi[3,c(1,4),drop=F]

############범주형 자료##############
#문자형도 포함되어 있으니까 data.frame으로 제작

data = data.frame("답"=c("좋다","보통이다","싫다","무응답","합"),
                  "도수"=c(71,42,28,9,150));data

data$상대도수 = round(data$도수/150,3)
data

library(MASS); str(Cars93); View(Cars93)
str(Cars93)
freq = table(Cars93$Type); freq
freq = table(data$"답"); freq
propfreq = prop.table(freq); propfreq
propfreq = round(propfreq,3); propfreq
New_table = rbind(freq,propfreq); New_table

freq = New_table[1,]
propfreq = New_table[2,]
X = data.frame("freq"=freq,"profreq"=profreq); X

origin = t(New_table)
View(origin)

X = addmargins(origin,margin=1);X

summary(Cars93$Price)
Price = cut(Cars93$Price, breaks=7)
freq = table(Price); freq
propfreq = prop.table(freq); propfreq
propfreq = round(propfreq,3); propfreq
table = rbind(freq,propfreq); table
new = t(table); new
summ = addmargins(table)
new = addmargins(new,margin=1); new

cumfreq = cumsum(freq); cumfreq
cumpropfreq = cumsum(propfreq); cumpropfreq

new = cbind(new,cumfreq);
new = cbind(new,cumpropfreq);
new
