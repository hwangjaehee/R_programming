install.packages("ggplot2")
#C:/Users/k9011/AppData/Local/R/win-library/4.2 <- R프로그램 패키지가가 설치되는 위치(?)
#첨부해주신 폴더 압축 풀어서 이 위치에 복사 붙여넣기 하기

library(prob) #library()를 이용하여 'prob'를 불러오기

#tosscoin(N)동전 N번 던지는 시행할 때으 표본공간을 보여주는 함수
tosscoin(2) 
tosscoin(3)
#표본 공간(sample space)의 부분 집합(subset)을 사건(event)이라고 한다.

install.packages("ggplot2")
#C:\Users\k9011\AppData\Local\Temp\RtmpwZj83p\downloaded_packages에 패키지 설치
library(ggplot2)
str(diamonds)
View(diamonds)
#cut:어떻게 잘랐느냐냐, clarity:얼마나 투명하냐.__다이아몬드 4c

#표본 공간(sample space)의 부분 집합(subset)을 사건(event)이라고 한다.
#다이아몬드 전체에서 cut==Preminum인 것만 보겠다.(일종의 부분집합)
subset(diamonds, cut=='Premium')

#OR(또는는)
subset(diamonds, c(cut=='Premium', cut=='Fair'))
#Can't subset rows with `r`//Logical subscript `r` must be size 1 or 53940, not 107880.
#Run `rlang::last_trace()` to see where the error occurred.
subset(diamonds, cut=='Premium' | cut=='Fair' )
subset(diamonds, cut=='Premium' | color=='E')

#AND(이면서)
subset(diamonds, cut=='Premium' & color=='E')

#예제
S <- rolldie(1) #주사위를 n 번 던져서 나오는 눈의 수 구하는 함수 rolldie(n)
EVEN <- subset(S, X1 %% 2==0) #표본공간 S의 결과 x1을 2로 나누었을 때 나누어 떨어지면면
nrow(EVEN)
nrow(EVEN)/nrow(S)
ODD <- subset(S, X1 %% 2==1)
MULTIPLE3 <- subset(S, X1 %% 3==0) #3의 배수가 나오는 경우

#예제5
#1에서 9까지 숫자가 하나씩 적힌 개의 공이 들어 있는 주머니에서
#한 개의 공을 꺼내는 시행을 한다.
#꺼낸 공에 적힌 숫자가 홀수인 사건을 A,
#8의 약수인 사건을 B,
#3의 배수인 사건을 C라고 할 때 다음을 구하여라.

S<-c(1:9);S
A=subset(S,S%%2==1)
B=subset(S,8%%S==0)
C=subset(S,S%%3==0)
# union( )을 이용하여 합집합(사건)을 구함
#(1)A∪B
union(A, B)
subset(S, S %% 2==1 | 8 %% S==0 )

# intersect( )를 이용하여 교집합(사건)을 구함
intersect(A, C)
subset(S, S %% 2==1 & S %% 3==0)

# intersect( )를 이용하여 교집합을 구하며, integer(0)은 공집합을 나타냄
intersect(B, C)
subset(S, 8 %% S==0 & S %% 3==0)
integer(0)

# setdiff( )를 이용하여 여집합을 구함
setdiff(S, A) #A:홀수인 사건. S에서 A의 여집합==짝수인 집합==나머지가 1이 아니다.
subset(S, S %% 2 != 1)

#드모르간 법칙 확인
#[ A의 여집합(짝수인집합) or B의 여집합(8의 약수가 아닌 집합) ]의 교집합
intersect( setdiff(S, A), setdiff(S, B) )
subset(S, S %% 2 != 1 & 8 %% S != 0)
setdiff( S, union(A, B) )


#############################################

#예제1
#하나의 동전을 두 번 던지는 실험
#S에서 앞면의 개수 구하기

#표본공간 S 위에서 정의된 하나의 실수값 함수를 확률변수(random variable)
library(prob)
S <- tosscoin(3) ; S # tosscoin( )을 이용하여 표본공간을 생성
function(x) sum(x == "H") # 앞면의 개수를 세는 함수를 정의
Hcount <- function(x) sum(x == "H")
X <- apply(S, 1, Hcount);X#s의 n행에서 h의 개수를 n번째에 출력(정답답)
#apply(분석할 데이터 행렬, 방향(1(행) 또는 2(열)), 함수)
Y <- apply(S, 2, Hcount);Y
#예제2
( freq <- table(X) )
( prob <- freq/length(X) )
( prob <- freq/nrow(S) )
library(MASS)
as.fractions( prob )
win.graph(7, 6) #새로운 팝업창에 그래프를 띄울 수 있음
plot(prob)
plot(prob,
     main="동전 3개를 던졌을 때 앞면의 수에 대한 확률분포", #제목
     xlab="앞면의 수",#x축 이름
     ylab="상대도수", #y축 이름름
     type="h", #선 type
     col="orange",
     ylim=c(0, max(prob)+0.03), #y축값 설정. 최대치가 결과값보다 얼마나 크게 할건지 설정가능
     lwd=5) #lwd : 선의 굵기


##예제3
f1 <- function(x) {4*x - 2*x^2}
c1 <- integrate(f1, 0, 2) # 적분 계산해주는 함수,f1함수를 x=0부터 x=2까지 하겠다.
c1 #결과값 2.666667
#c1의 값에 상수c를 곱했을 때 1이 되어야 함. 따라서 상수c는 2.66667의 역수수
library(MASS) 
as.fractions(2.666667) #c1을 분수로 표시한 후 역수를 취함
as.fractions(1/2.666667)
pdf <- function(x) {(3/8)*(4*x - 2*x^2)}
integrate(pdf, 1, 2)


##예제4
pdf <- function(x) {100/x^2}
c <- integrate(pdf, 100, 150) 
c
library(MASS) 
as.fractions(0.3333333)
p <- choose(5, 2) *(1/3)^2 *(2/3)^3
p
as.fractions(p)
as.fractions(0.3292181) #fractions의 뜻이 '분수'임!

