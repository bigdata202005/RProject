install.packages("tidyverse")
install.packages("gcookbook")
library(ggplot2)
library(dplyr)

# 산점도그래프그리기
mtcars
dim(mtcars)
str(mtcars)

ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()

ggplot(data = NULL, aes(x = mtcars$wt, y = mtcars$mpg)) + geom_point()

# 선 그래프 그리기 : type = "l"
# 기본기능이용
plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)

# ggplot이용
ggplot(pressure, aes(x = temperature, y = pressure)) +  geom_line() 
ggplot(pressure, aes(x = temperature, y = pressure)) +  geom_line() + geom_point()


# 바그래프그리기
BOD
barplot(BOD$demand, names.arg = BOD$Time)

ggplot(BOD, aes(x = Time, y = demand)) + geom_col()
ggplot(BOD, aes(x = factor(Time), y = demand)) + geom_col()

# 아래의데이터를이용하여막대그래프를그려보자
mtcars$cyl
barplot(mtcars$cyl) # graphic
ggplot(mtcars, aes(x = cyl)) + geom_bar() # ggplot

# 같은 숫자들의 개수를 구하기
table(mtcars$cyl)
barplot(table(mtcars$cyl))  # graphic
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar() # ggplot


# 히스토그램 그리기
hist(mtcars$mpg)
ggplot(mtcars, aes(x = mpg)) +  geom_histogram(binwidth = 4)


hist(mtcars$mpg, breaks = 10) # graphic
ggplot(mtcars, aes(x = mpg)) +  geom_histogram()


# 박스그래프그리기
plot(ToothGrowth$supp, ToothGrowth$len)

boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)

ggplot(ToothGrowth, aes(x = supp, y = len)) + geom_boxplot()


# 곡선 그래프 그리기
curve(x^3 - 5*x, from = -4, to = 4)

# 그래프를 그릴 사용자 정의 함수 작성
myfun <- function(xvar) {
  1 / (1 + exp(-xvar + 10))
}

for(i in 0:20){
  print(myfun(i))
}

curve(myfun(x), from = 0, to = 20)

for(i in 0:20){
  print(1-myfun(i))
}

curve(1 - myfun(x), add = TRUE, col = "red")

# ggplot사용
ggplot(data.frame(data = 0:20), aes(x = data)) + stat_function(fun = myfun, geom = "line")



