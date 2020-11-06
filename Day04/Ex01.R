# mapply()는 sapply()와 유사하지만 다수의 인자를 함수에 넘긴다는데서 차이가 있다. 
# 예를들어 숫자 1, 2, 3과 문자열 “a”, “b”, “c”를 짝지어서 (1, “a”), (2, “b”), (3, “c”)로 
# 묶어 함수에 넘기는 다음 예를 살펴보자.

mapply(function(i, s) {sprintf(" %d%s" , i, s)}, 1:3, c(" a" , " b" , " c" ))

# 위의 식을 풀어쓰면 다음과 같다
fn = function(i, s) {sprintf(" %d%s" , i, s)}
fn(1,'A')
v1 = 1:3
v1
v2 = c(" a"," b"," c")
v2
fn(v1, v2)

# iris의 각 컬럼 평균을 구하는 경우를 살펴보자.
mapply(mean , iris [1:4])

head(iris)  
head(iris [1:4])

# iris 데이터에 대한 통계 자료를 summary()로 살펴본 예이다.
# Sepal.Length 등과 같은 수치형 자료에 대해서는 최소값, 1사분위수, 중앙값, 평균, 3사분위
# 수, 최대값을 보여준다. Species는 factor형 자료이므로 각 Species마다 몇개의 값이 있는지를
# 보여준다.
summary(iris)

# 참고로 수치형 자료의 분포는 quantile()을 통해서도 알아볼 수 있다.
quantile(iris$ Sepal.Length )
quantile(iris$Sepal.Width )
quantile(iris$ Sepal.Length , seq(0, 1, by=0.1))

# doBy 패키지의 summaryBy()는 그 이름에서 짐작할 수 있듯이 원하는 컬럼의 값을 특정
# 조건에 따라 요약하는 목적으로 사용된다. 
# 예를들어, Sepal.Length와 Sepal.Width를 Species에 따라 살펴보려면 다음과 같이 하면 된다.
install.packages("doBy")
library(doBy)

# "::" 다른 언어와 마찬가지로 네임스페이스를 표현하는데 사용된다. 
? summaryBy
? doBy::summaryBy

# 위 코드에서 ‘Sepal.Length + Sepal.Length ∼ Species’ 부분은 formula라고 하는데, 처리할
# 데이터를 일종의 수식으로 표현하는 방법이다. 이 예에서는 Sepal.Width와 Sepal.Length를 +
# 로 연결해 이 두가지에 대한 값을 차례로 컬럼으로 놓고, 각 행에는 Species를 배열하기위해 ∼
# Species를 붙여주었다.
summaryBy(Sepal.Width + Sepal.Length ~ Species , iris)
doBy::summaryBy(Sepal.Width + Sepal.Length ~ Species , iris)

# orderBy()는 데이터를 정렬하기 위한 목적으로 사용한다. 첫번째 예는 모든 데이터를
# Sepal.Width로 배열하는 예이다. 모든 데이터를 보여줄 것이므로 ∼ 좌측에는 아무것도 적
# 지 않는데, 그러면 모든 컬럼을 의미하게 된다.
orderBy(~ Sepal.Width , iris)

# 먼저 Species 순으로 정렬되고 그 안에서 Sepal.Width로 정렬
orderBy(~ Species + Sepal.Width , iris)

# 보통 R코드에서는 orderBy() 함수보다는 R에 기본적으로 포함된 base 패키지의 order()함
# 수를 많이 사용한다. order()함수는 주어진 값을 정렬했을때의 색인을 순서대로 반환하는데,
# 이를 사용해 정렬된 결과를 얻을 수 있다.

order(iris$ Sepal.Width)
iris[order(iris$ Sepal.Width) ,]

# base package
# sample : 추출한다
sample(1:10, 5)
# 중복허용
sample(1:10, 5, replace = TRUE)
sample(1:10, 5, replace = FALSE)
# 섞기
sample (1:10 , 10)

# 이를 사용하면 iris 데이터역시 무작위로 섞을 수 있다. 다음 코드에서 NROW()는 주어진
# 데이터 프레임 또는 벡터의 행의 수 또는 길이를 반환하는 함수이다.
? nrow
NROW(iris)
iris[sample(NROW(iris), NROW(iris)) ,]
iris[1,]
iris[1,1:4]
iris[c(1,3,5), 1:4]
sample(150,150)
iris[sample(150,150),]

test_df = iris[1:10,]
test_df

test_df2 = iris[1:10,1:2]
test_df2

# 보통은 주어진 데이터에서 각 Species 마다 10% 씩을 뽑아서 test data로 활용하고 싶은 경우가 
# 더 많을 것이다. sampleBy()는 이런 경우에 유용하게 사용할 수 있다.
sampleBy(~Species , frac =0.1 , data=iris)
# 30%
sampleBy(~Species , frac =0.3 , data=iris)


# split()은 데이터를 분리하는데 사용된다. 형식은 ‘split(데이터, 분리조건)’이다.
split(iris , iris$Species)
sp = split(iris , iris$ Species)
class(sp)
sp$setosa
sp$versicolor

split(iris$Sepal.Length , iris$ Species)
lapply(split(iris$ Sepal.Length , iris$ Species), mean)

# subset()은 split()과 유사하지만 전체를 부분으로 구분하는 대신 "특정 부분만 취하는 용도"로
# 사용한다. 다음은 iris에서 setosa종만 뽑아내는 예이다.
setosa = subset(iris , Species == "setosa" )
setosa
class(setosa)
versicolor = subset(iris , Species == "versicolor" )
versicolor
class(setosa)
# 벡터간 연산에서의 AND는 &&가 아니라 &를사용해야한다. 
# subset(iris , Species == "setosa" && Sepal.Length > 5.0)
subset(iris , Species == "setosa" & Sepal.Length > 5.0)

# subset에 select 인자를 지정하면 특정 열을 선택하거나 제외할 수 있다. 
# 다음은 Sepal.Length와 Species열을 iris에서 선택하여 출력한 예이다.
subset(iris , select=c(Sepal.Length , Species))
subset(iris , select=c(1,3,4))
subset(iris , Species == "versicolor", select = 1:4 )
# 특정 열을 제외하고자한다면 ‘-’를 열이름 앞에 붙이면 된다.
versicolor = subset(iris , Species == "versicolor", select = -c(5) )
versicolor


# merge()는 두 데이터 프레임을 공통된 값을 기준으로 묶는 함수로서 데이터베이스에서 join과
# 같은 역할을 한다. 
x <- data.frame(name=c(" a" , " b" , " c" ), math=c(1, 2, 3))
y <- data.frame(name=c(" c" , " b" , " a" ), english=c(4, 5, 6))
x
y
cbind(x, y)
merge(x, y, all=T)

x <- data.frame(name=c(" a" , " b" , " c" , "e"), math=c(1, 2, 3, 8))
x
y <- data.frame(name=c(" c" , " b" , " a", "d" ), english=c(4, 5, 6, 7))
y

cbind(x, y)
merge(x, y)
merge(x, y, all=T)
merge(x, y, all.x=T)
merge(x, y, all.y=T)

# sort()는다음과 같이 벡터를 정렬하는 목적으로 사용한다.
v1 = sample(1:45, 6)
v1
v2 = sort(v1)
v2
# sort()는 값을 정렬한 그 결과를 반환할 뿐이지 인자로 받은 벡터 자체를 변경하지 않는다
v1
v3 = sort(v1, decreasing = T)
v3

# order()는 주어진 인자를 정렬하기 위한 각 요소의 색인을 반환한다.
v4 = order(v1)
v4
v1
# 만약 큰수부터 정렬한 결과를 얻고싶다면 값에 -1 을 곱하면 된다.
v5 = order(-v1)
v5

# order()를 데이터 프레임을 정렬하는데 사용할 수 있다. 다음은 iris를
# Sepal.Length에 따라 정렬한 예이다.
head(iris, 5)
head(order(iris$ Sepal.Length))
head(iris[order(iris$ Sepal.Length), ], 5)
# Petal.Width로 정렬하여 상위 10개만 1,2,3,4 필드만
head(order(iris$Petal.Width), 10)
head(iris[order(iris$Petal.Width), 1:4], 10)

# Sepal.Length가 같을 경우 Sepal.Width의 순서에 따라 정렬
head(order(iris$ Sepal.Length, iris$Petal.Length))
head(iris[order(iris$ Sepal.Length, iris$Petal.Length), ], 5)

# with()는 데이터 프레임 또는 리스트내 필드를 손쉽게 접근하기 위한 함수이다. 
# ‘with(data, expression)’ 형태로 작성한다.
# 예를들어 iris의 Sepal.Length, Sepal.Width의 평균을 다음과 같이 구했다고 해보자.
print(mean(iris$Sepal.Length))
print(mean(iris$Sepal.Width))

with(iris , {
  print(mean(Sepal.Length))
  print(mean(Sepal.Width))
})


# within()은 with()와 비슷하지만 데이터를 수정하는데 사용한다. 
df1 <- data.frame(val=c(1, 2, 3, 4, NA , 5, NA))
df1
class(df1)
df2 <- within(df1, {
    val <- ifelse(is.na(val), median(val , na.rm=TRUE), val)
})
df2
##### 아래와 같이 할 수 있지만 자신이 변경 된다.
df4 = df1$val[is.na(df1$val)] = median(df1$ val , na.rm=TRUE)
df4
df1
# df1값이 4이상인 데이터는 +2를 하고 4미만인 데이터는 *2를 해라!!
df3 = within(df1, {
  val = ifelse(val>=4, val+2, val*2)
})
df3

# iris내 일부 데이터가 결측치인 경우일때, 
# 결측치를 해당 종(Species)의 중앙값으로 바꾸는 경우이다.

df2 = head(iris, 10)  # 10
df2
df2[1, 1] = NA
df2[5, 1] = NA
df2
median_per_species =  sapply(split(df2$ Sepal.Length , df2$ Species),  median , na.rm=TRUE)
class(median_per_species)

median_per_species

df3 <- within(df2 , {
    Sepal.Length = ifelse(is.na(Sepal.Length), median_per_species[Species], Sepal.Length )
})
df3

# with()와 비슷하게 사용할 수 있는 함수가 attach() 이다. 
# attach는 인자로 주어진 데이터 프레임이나 리스트를 곧바로 접근할 수 있게 해준다. 
# 이를 해제하려면 detach()를 사용한다.
iris$Sepal.Width
iris$Sepal.Length
iris$Petal.Length
iris$Petal.Width
Sepal.Width

attach(iris)
head(Sepal.Width)
head(Sepal.Length)
head(Petal.Length)

detach(iris)
Sepal.Width
iris$Sepal.Width

# 주의할점은 attach()한 변수값은 detach()시 원래의 데이터 프레임에는 반영되지 않는다는
# 점이다.
head(iris$Sepal.Width, 5)
attach(iris)
Sepal.Width [1] = -1
head(Sepal.Width, 5)
detach(iris)
head(iris$Sepal.Width, 5)


# which()는 벡터 또는 배열에서 주어진 조건을 만족하는 값이 있는 곳의 색인을 찾는다. 
# c(2, 4,6, 7, 10)의 벡터에서 2로 나눈 나머지가 0인 값이 저장된 색인과 그 값을 찾아보자.

v1 = c(2, 4, 6, 7, 10)
v1
v1%%2
v2 = which(v1 %% 2 == 0)
v2

# 1~100사이의 숫자중 20개를 벡터로 만들고 3의 배수의 위치를 찾아라
v3 = sample(1:100, 20)
v3
v4 = which(v3%%3==0)
v4
length(v4)

# which.min()과 which.max()는 주어진 벡터에서 최소 또는 최대 값이 저장된 색인을 찾는
# 함수이다.
v3
# 최소 또는 최대 값이 저장된 위치
which.max(v3)
which.min(v3)

# 최소 또는 최대 값이 저장된 값
sort(v3)[1]
sort(v3, decreasing = T)[length(v3)]

sort(v3, decreasing = T)[1]
-sort(-v3)[1]
sort(v3)[length(v3)]

v3[which.max(v3)]
v3[which.min(v3)]

max(v3)
min(v3)

# doBy 패키지 (페이지 99)가 데이터를 그룹별로 나눈뒤 특정 계산을 적용하는 함수인 반면
# aggregate()는 보다 일반적인 그룹별 연산을 위한 함수이다. 
# 기본적인 형태는 aggreate(데이터,그룹 조건, 함수) 
# 또는 
# aggreagte(formula, 데이터, 함수)이다. 
# 이중 여기서는 더 편리한 formula 형태의 방법을 살펴보자
#         col ~ row
aggregate(Sepal.Width ~ Species , iris , mean)


data_df = data.frame(medicine=c(" a" , " b" , " c" ), ctl=c(5, 3, 2), exp=c(4, 5, 7))
data_df
stacked_x <- stack(data_df)
stacked_x

library(doBy)
summaryBy(ind ~ values , stacked_x)

# unstack()은 그 이름에서 짐작할 수 있듯이 stack()을 통해 변환된 데이터를 다시 원래 상
# 태로 되돌리는데 사용한다.
data_df
data_df2 = unstack(stacked_x, values ~ ind)
data_df2

# R에서 MySql사용하기
# 패키지 설치
install.packages ("RMySQL" )
# 라이브러리 임포트
library(RMySQL)

# Connect
con = dbConnect(MySQL(), user="jspuser", password="123456", 
                dbname="mydb", host="127.0.0.1")


# 한글설정 
dbSendQuery(con, "SET NAMES utf8;") 
dbSendQuery(con, "SET CHARACTER SET utf8;") 
dbSendQuery(con, "SET character_set_connection=utf8;")


# table list
dbListTables(con)

# score table data
db_data = dbGetQuery(con , "select * from score" )
db_data

db_data2 = dbGetQuery(con , "select * from employee")
class(db_data2)
db_data2
db_data2[2]
# 열의 인코딩 변경
Encoding(db_data2[, 2]) <- 'UTF-8'
db_data2[2]
db_data2

db_data3 = dbGetQuery(con , "select * from memo")
db_data3
Encoding(db_data3[, 2]) <- 'UTF-8'
Encoding(db_data3[, 4]) <- 'UTF-8'
db_data3
db_data3[6]
