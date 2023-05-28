# 확률통계프로그래밍 중간고사 답안지
# 이름:              학번:

# [문제1]
3
5

# [문제2]
4

# (3-7번) R-code로 작성하시오.

# [문제3]
log10(100)-sqrt(log2(8))

# [문제4] (1) 
m1 <- rbind(c(1,5,0,-2), c(3,-4,5,3),c(0,6,7,-3)) ; m1 
# [문제4] (2) 
m1[c(2,3),c(2,4)]
 
# [문제5]
대한민국<-c(3.2,2.9,2.2)
캐나다<-c(2.0,2.8,1.9)
미국<-c(2.3,2.9,2.3)
chart <- rbind(대한민국, 캐나다,미국) 
label <- c('대한민국', '캐나다', '미국') 
barplot(chart,
        main='국가별 연도별 경제성장률', 
        xlab='국가', ylab='성장률', 
        ylim=c(0, 3.3),
        col=c('Green', 'Red','Blue'),
        legend.text=c('2017', '2018','2019'),
        beside=TRUE,
        names.arg=label
)

# [문제6] (1)
library(MASS)
str(iris)
View(iris)
#행번호 초기화화
rownames(iris) <- NULL ; iris
str(iris)
sol6 <- iris[order(iris$Petal.Length, -iris$Sepal.Length)] 
# [문제6] (2) 
freq_sp<-table(iris$Species)
freq_sp
propfreq_sp<-prop.table(freq_sp)
propfreq_sp

propfreq_sp <- round(propfreq_sp,3)
propfreq_sp

table<-rbind(freq_sp,propfreq_sp);table
table<-addmargins(table,margin=2);table

# [문제6] (3) 

iris$Species
iris$Petal.Length

spi<-data.frame(iris$Species)
leng<-data.frame(iris$Petal.Length)
d<-rind(spi,leng)
boxplot(d,
        main="품종별 꽃잎의 길이",
        names=c("setosa","versicolor","virginica"),
        col=c("Yellow","Red","Blue"))
