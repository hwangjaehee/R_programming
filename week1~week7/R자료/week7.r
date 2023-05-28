# 원형그래프(Pie Chart)
data()
library(MASS)
data(Cars93)
str(Cars93) #93 obs of 27 variables: 27컬럼의 93데이터 개수
View(Cars93)
freq = table(Cars93$Type)
pie(freq)

pie(freq,
    main="차량종류",
    col=rainbow(length(freq)),
    paste(round(freq/sum(freq)*100),"%"), #상대도수(비율)구하는 식과 반올림 활용해서 붙여넣기
    radius=1) #반지름

# paste() / paste0() 함수 익히기(강의록에 있는 것 더 쓰기)
paste("안녕","하세요")
paste(c("안녕","하세여"))

#ggplot2를 작성하면 더 자세하게 쓸 수 있다
#억지로 작성(labels 이용)
unique(Cars93$Type)
sort(unique(Cars93$Type))

#3차원 원그래프 작성하기
install.packages('plotrix')
library(plotrix)
pie3D(freq,
      main="차량종류")

pie3D(freq,
      main="차량종류",
      explode=0.2) #조각들을 분리시킬 간격 설정정

pie3D(freq,
      main="차량종류",
      col=rainbow(length(freq)),
      labels=names(freq), #names 함수수
      explode=0.2,
      radius = 1.3)

#과제
new_freq = c(160539,15004,30916,1208,20892,14771)
new_name = c("승용차 ","승합차","화물","특수","이륜차","기타")

pie3D(new_freq,
      main="종류별 교통사고 건수",
      col=rainbow(length(new_freq)),
      explode=0.2,
      radius=1.3,
      labels=new_name)

#과제 2차시도 (파일 다루는 방식)
round(new_freq/sum(new_freq)*100)
car_csv = read.csv("C:\\Users\\soobe\\Desktop\\2학년 1학기\\확률통계프로그래밍\\코드\\교통사고건수_20230414094547.csv",fileEncoding="euc-kr")
View(car_csv)
str(car_csv)



#줄기 잎 그림
#unlist 함수 -> list 자료형을 벡터로 변환시키기(기본적인 통계함수들은 하나의 자료형들로만 이루어졌을 때 작동)
data = read.table("C:\\Users\\soobe\\Desktop\\2학년 1학기\\확률통계프로그래밍\\강의 PDF\\data\\english.txt",fileEncoding="euc-kr")
is.list(data)
is.data.frame(data)
data_ul = unlist(data)
stem(data_ul)

data = read.table("C:\\Users\\soobe\\Desktop\\2학년 1학기\\확률통계프로그래밍\\강의 PDF\\data\\salary.txt",fileEncoding="euc-kr")
is.list(data)
is.data.frame(data)
data_ul = unlist(data)
stem(data_ul)

str(mtcars)
View(mtcars)
stem(mtcars$mpg)
