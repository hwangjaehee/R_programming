install.packages("prob")
library(prob)

#한 실험(조사)의 모든 가능한 결과들의 모임 : 그 실험의 표본공간
#tosscoin()을 이용하여 표본공간을 구함
tosscoin(2)   #동전을 2번 던졌을 때
tosscoin(3)   #동전을 3번 던졌을 때

#subset()함수 : 조건을 만족하는 벡터,행렬,데이터 프레임의 일부를 반환한다.
#subset(x(데이터 이름),
#subset = (선별 조건),
#select=c(변수명))

install.packages("ggplot2")
library(ggplot2)
str(diamonds)
View(diamonds)
#cut=='Preminum'조건에 만족하는 데이터만 추출함

subset(diamonds,cut=='Premium')   #조건이 하나일 때
subset(diamonds, cut=='Premium'|cut=='Fair')  #또는 조건
subset(diamonds,cut=='Premium'&color=='E')  #여러 조건 만족

#select
a=subset(diamonds, cut=='Premium' & color=='E', select=clarity)
View(a)
subset( diamonds, cut=='Premium' & color=='E', select=c(clarity, price) )
subset(diamonds, cut=='Premium' & color=='E', select=clarity:price)
subset( diamonds, cut=='Premium' & color=='E', select=c(depth, price) )


#예제4
#표본공간 S
#짝수의 눈이 나오는 경우를 사건 A
#홀수의 눈이 나오는 경우를 사건 B
#3의 배수가 나오는 경우를 사건 C
#사건으로 표시하여라

S=rolldie(1) #rolldie(n) : 주사위 n개 던졌을 때 나오는 모든 경우의 수

S #주사위 눈이 나오는 표본공간
nrow(S) #표본공간 원소의 개수
#사건 A. 짝수의 눈이 나오는 경우
A=subset(S,X1%%2==0)
A
nrow(A) #사건 A의 원소의 개수
B=subset(S,X1%%2!=0);B #사건B. 홀수의 눈이 나오는 경우, B 모든 경우 출력 
nrow(B) #사건 B의 원소의 개수
C=subset(S,X1%%3==0); #사건 C의 원소의 개수,C출력
nrow(C)
