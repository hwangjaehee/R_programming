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

cat("P(A)=n(A)/n(S)=",nrow(A)/nrow(S),"\n")
cat( "사건 A가 일어날 확률은", nrow(A)/nrow(S),"이다.","\n")

#예제5
#1에서 9까지 숫자가 하나씩 적힌 개의 공이 들어 있는 주머니
#주머니에서 한 개의 공을 꺼내는 시행
#꺼낸 공에 적힌 숫자가 홀수인 사건을 A
#8의 약수인 사건을 B
#3의 배수인 사건을 C


# library( ) 함수를 이용하여 ‘prob’를 불러오기
library(prob)
# c( )를 이용하여 표본공간을 객체 S에 할당함
S <- c(1:9) 
# A, B, C 사건을 각각 구함
A=subset(S, S %% 2==1)
B=subset(S, 8 %% S==0)
C=subset(S, S %% 3==0)

# (1) union( )을 이용하여 합집합(사건)을 구함
union(A, B) #각 집합을 순서대로 중복되지 않게 합치는 느낌 
subset(S, S %% 2==1 | 8 %% S==0 ) #오름차순으로 정렬까지 함

# (2) intersect( )를 이용하여 교집합(사건)을 구함
intersect(A, C)
subset(S, S %% 2==1 & S %% 3==0)

# (3) intersect( )를 이용하여 교집합을 구하며, integer(0)은 공집합을 나타냄
intersect(B, C)
subset(S, 8 %% S==0 & S %% 3==0)
# integer(0) 은 공집합을 나타냄

# (4)setdiff( )를 이용하여 여집합을 구함
setdiff(S, A)
subset(S, S %% 2 != 1)

# (5) setdiff( )를 이용하여 여집합을 구함
setdiff(S, B)
subset(S, 8 %% S != 0)

# (6) setdiff()를 이용하여 여집합을 구함
intersect( setdiff(S, A), setdiff(S, B) )
subset(S, S %% 2 != 1 & 8 %% S != 0)

setdiff( S, union(A, B) ) # De Morgan's laws