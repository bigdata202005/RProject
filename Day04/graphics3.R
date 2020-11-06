# 상자 그림(boxplot)
# 상자 그림은 데이터의 분포를 보여주는 그림으로 가운데 상자는 제1사분위수, 중앙값,
# 제3사분위수를 보여준다. 상자의 좌우 또는 상하로 뻗어나간 선(whisker 라고 부름)은 중앙값 -
#   1.5 * IQR 보다 큰 데이터 중 가장 작은 값(lower whisker라고 부름), 중앙값 + 1.5 * IQR 보다
# 작은 데이터 중 가장 큰 값(upper whisker)을 각각 보여준다. IQR은 Inter Quartile Range의 약
# 자로 ‘제3사분위수 - 제1사분위수’로 계산한다. 그래프에 보여지는 점들은 outlier에 해당하는데
# lower whisker 보다 작은 데이터 또는 upper whisker 보다 큰 데이터가 이에 해당한다.

boxplot(iris$Sepal.Width)
boxstats = boxplot(iris$Sepal.Width)
boxstats

boxstats <- boxplot(iris$Sepal.Width , horizontal=TRUE)
text(boxstats$out , rep(1, NROW(boxstats$out)), labels=boxstats$out,   pos=1, cex=1.5)

# notch 라는 인자를 지정되면 median 값에 대한 신뢰구간이 오목하게 그려진다.
sv <- subset(iris , Species =="setosa" | Species =="versicolor" )
str(sv)
sv$Species <- factor(sv$ Species)
str(sv)
boxplot(Sepal.Width ~ Species , data=sv , notch=TRUE)


# 히스토그램(hist) : hist(x)
# 자료의 분포를 알아보는데 유용한 또 다른 그래프는 히스토그램이다. 
hist(iris$Sepal.Width)
x = sample(1:100, 60)
x
hist(x)

# freq의 기본 값은 NULL이며, 값이 지정되지 않으
# 면 히스토그램 막대가 각 구간별 데이터의 갯수로 그려진다. 만약 이 값이 FALSE이면 다음
# 코드에서 보다시피 각 구간의 확률 밀도가 그려진다. 확률 밀도이므로 막대의 너비의 합이 1이
# 된다.
hist(iris$Sepal.Width, freq = F)
hist(iris$Sepal.Width, freq = T)
hist(x, freq = F)
result = hist(x, freq = T)
result

# 밀도 그림(density)
# 경계에서 분포가 확연히 달라지지 않는 kernel density estimation6)에 의한 밀도 그림
hist(iris$Sepal.Width)
plot(density(iris$ Sepal.Width))


hist(iris$Sepal.Width, freq = F)
lines(density(iris$ Sepal.Width))
rug(jitter(iris$ Sepal.Width))

# 막대 그림(barplot) : 막대 그림은 barplot() 함수를 사용해 그린다. 
# Species별 Sepal.Width의평균으로 막대 그래프 
tapply(iris$Sepal.Width , iris$Species , mean)
barplot(tapply(iris$Sepal.Width , iris$Species , mean))

# 파이 그래프(pie) : 데이터의 비율을 알아보는데 적합하다.
# Sepal.Length의 구간별 비율을 파이 그래프로 그려보기로 한다.
# 구간으로 데이터를 나누기 위해서는 cut() 함수를 사용한다. 
# cut()은 인자로 구간으로 나눌 데이터와 breaks를 받는다. 
# breaks에는 나눌 구간을 직접 넘겨도 되고 나눌 구간의 수를 넘겨도 된다.
cut (1:10 , breaks=c(0, 5, 10))
cut (1:10 , breaks =3)

# Sepal.Width를 10개의 구간으로 나눠보자.
cut(iris$Sepal.Width , breaks =10)


# 파이 그래프를 그리려면 이 factor 데이터를 그대로 사용할 수는 없으며, 나눠진 각 구간에
# 몇개의 데이터가 있는지 세야한다. table() 함수는 이러한 목적으로 사용되며 factor 값을 받
# 아 분할표(Contingency Table. Cross Tabulation 또는 Cross Tab이라고도 부름)를 만든다.
# 테이블 함수 사용법
rep(c("a" , "b" , "c" ), 1:3)
table(rep(c("a" , "b" , "c" ), 1:3))

# cut을 이용하여 10개 구간으로 나누고 
# table함수를 이용하여 개수를세고
table(cut(iris$Sepal.Width , breaks =10))
# pie함수를이용하여그래프
pie(table(cut(iris$Sepal.Width , breaks =10)))























