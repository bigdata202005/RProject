# 여기에있는 대부분의 레시피는 
# ggplot2 플로팅 패키지와 데이터 랭 글링을위한 dplyr 패키지를 사용합니다. 
# 이 패키지는 모두 데이터 작업을 더 쉽게 해주는 R 패키지 모음 인 tidyverse의 일부입니다 . 
# 일부 레시피에는 최신 버전의 ggplot2, 3.0.0이 필요하며이를 위해서는 상대적으로 최신 버전의 R이 
# 필요합니다. 
# 언제든지 기본 R 프로젝트 사이트 인 http://www.r-project.org 에서 최신 버전의 R을 얻을 수 있습니다 . 

# R을 설치했으면 필요한 패키지를 설치할 수 있습니다. 
# tidverse 패키지 외에도이 책에있는 많은 예제에 대한 데이터 세트가 포함 된 gcookbook 패키지를 설치하고 싶을 것입니다. 
# 다음을 사용하여 tidyverse 패키지와 gcookbook 패키지를 설치할 수 있습니다.
install.packages("tidyverse")
install.packages("gcookbook")

# Comprehensive R Archive Network 인 CRAN의 미러 사이트를 선택하라는 메시지가 표시 될 수 있습니다. 
# 모든 사이트가 작동해야하지만 멀리있는 사이트보다 빠를 가능성이 높으므로 가까운 사이트를 선택하는 것이 좋습니다. 
# 패키지를 설치했으면이 책의 레시피를 사용하려는 각 R 세션에서 ggplot2 및 dplyr 패키지를로드합니다.
library(ggplot2)
library(dplyr)


# 빠르게 살펴 보기

# 1. 산점도 만들기
#    산점도를 만들려면  x 값 벡터와 y 값 벡터를 사용 plot()하고 전달 합니다.

# mtcars는 1974 Motor Trend US Megazine에 수록된 차량과 차량에 관련된 수치들이 기록된 자료이다.
# 변수명		변수설명
# mpg		    연비 (Miles per Gallon)
# cyl		    실린더 개수
# disp		  배기량
# hp		    마력
# drat		  후방차축 비율
# wt		    무게
# qsec		  1/4 마일에 도달하는데 걸린 시간
# vs		    엔진 (0 : V engine 1 : Straight engine)
# am		    변속기 (0 : 자동, 1 : 수동)
# gear		  기어 개수?
# carb		  기화기(카뷰레터) 개수

head(mtcars)
str(mtcars)
plot(mtcars$wt, mtcars$mpg)

# ggplot2를 사용하면 ggplot() + geom_point() 함수를 사용하여 유사한 결과를 얻을 수 있습니다 
ggplot(mtcars, aes(x = wt, y = mpg)) +  geom_point()

# 2. 선 그래프 만들기
# pressure : 온도에 따른 수은의 증기압 데이터

head(pressure)
str(pressure)

plot(pressure$temperature, pressure$pressure, type = "l")
plot(pressure$temperature, pressure$pressure, type = "o")

plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col = "red")
points(pressure$temperature, pressure$pressure/2, col = "red")

# ggplot2를 사용하면 ggplot() + geom_line() 함수를 사용하여 유사한 결과를 얻을 수 있습니다 
ggplot(pressure, aes(x = temperature, y = pressure)) +  geom_line()
ggplot(pressure, aes(x = temperature, y = pressure)) +  geom_line() + geom_point()

# 3. 막대 그래프 만들기
# BOD : 생화학 적 산소 요구량
BOD
str(BOD)
barplot(BOD)

# Error in barplot.default(BOD) : 
#   'height'는 반드시 벡터 또는 행렬이어야 합니다
barplot(BOD$demand)
barplot(BOD$demand, names.arg = BOD$Time)
barplot(BOD$demand, names.arg = month.abb[1:6])


mtcars$cyl
# table() : 값들의 빈도수를 보여준다.
table(mtcars$cyl)
barplot(table(mtcars$cyl))
barplot(table(mtcars$cyl), names.arg = c('4개','6개','8개'))

# ggplot2를 사용하면 geom_col()을 사용하여 유사한 결과를 얻을 수 있습니다. 
# 값 의 막대 그래프를 그리려면 geom_col()을 사용하십시오. 
# x 변수가 연속적 일 때와 이산적일 때 출력의 차이를 확인하십시오 .
ggplot(BOD, aes(x = Time, y = demand)) + geom_col()
ggplot(BOD, aes(x = factor(Time), y = demand)) + geom_col()

ggplot(mtcars, aes(x = cyl)) +  geom_bar()
ggplot(mtcars, aes(x = factor(cyl))) +  geom_bar()

# 이전 버전의 ggplot2에서 값의 막대 그래프를 만드는 데 권장되는 방법은
# geom_bar(stat = "identity"). 
# ggplot2 2.2.0부터 geom_col()동일한 기능을 수행 하는 기능이 있습니다.

# 4. 히스토그램 생성
#    히스토그램을 사용하여 1 차원 데이터의 분포를 확인하려고합니다.
#    hist()값으로 구성된 벡터를 사용 하고 전달합니다.
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 10)

# ggplot2를 사용하면 geom_histogram()을 사용하여 비슷한 결과를 얻을 수 있습니다.
ggplot(mtcars, aes(x = mpg)) +  geom_histogram()
ggplot(mtcars, aes(x = mpg)) +  geom_histogram(binwidth = 4)
ggplot(mtcars, aes(x = mpg)) +  geom_histogram(binwidth = 8)


# 5. 상자 그래프 만들기
# 분포를 비교하기 위해 상자 그림을 만들고 싶습니다.
# 상자 그림을 만들려면 x 값 y 값의 벡터를 사용 하고 전달합니다. 
# x가 요인 (숫자 벡터와 반대) 인 경우 자동으로 상자 그림이 생성됩니다.

# ToothGrowth : 비타민 C가 기니피그의 치아 성장에 미치는 영향
# len	     치아 길이
# supp	   보충 유형 (VC 또는 OJ).
# dose	   정량	 1일 용량
head(ToothGrowth)
str(ToothGrowth)
plot(ToothGrowth$supp, ToothGrowth$len)

# 두 벡터가 동일한 데이터 프레임에 있으면 boxplot()수식 구문과 함께 함수를 사용할 수도 있습니다.
# 이 구문을 사용하면 그림 2.10 과 같이 x 축에서 두 개의 변수를 결합 할 수 있습니다 .
boxplot(len~supp, data = ToothGrowth)
boxplot(len~supp+dose, data = ToothGrowth)

# ggplot2 패키지를 geom_boxplot()사용 다음과 같은 유사한 결과를 얻을 수 있습니다.
ggplot(ToothGrowth, aes(x = supp, y = len)) +  geom_boxplot()
# interaction() 변수를와 결합하여 여러 변수에 대한 상자 플롯을 만들 수도 있습니다 .
ggplot(ToothGrowth, aes(x = interaction(supp, dose), y = len)) +  geom_boxplot()


# 6. 함수 곡선 그리기
curve(x^3 - 5*x, from = -4, to = 4)

fn = function(x, y){
  return(x^3 - 5*x) 
}

curve(fn, from = -4, to = 4)


# 직접 정의한 함수를 포함하여 숫자형 벡터를 입력으로 받고 
# 숫자 형 벡터를 반환하는 모든 함수를 플로팅 할 수 있습니다. 
# add = TRUE하면 이전에 생성 된 플롯에 곡선이 추가됩니다.
myfun <- function(xvar) {
  1 / (1 + exp(-xvar + 10))
}
curve(myfun(x), from = 0, to = 20)
curve(1 - myfun(x), add = TRUE, col = "red")

# ggplot2 를 사용 하면 숫자 형 벡터를 입력으로 받고 
# 숫자 형 벡터를 반환하는 함수를 사용 하고 
# stat_function(geom = "line") 전달 하여 비슷한 결과를 얻을 수 있습니다.
ggplot(data.frame(x = c(0, 20)), aes(x = x)) + stat_function(fun = myfun, geom = "line")

