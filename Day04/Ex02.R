# sqldf는 이런 부담을 털어버리는데 큰 도움이 되는 패키지로 SQL문을
# 사용할줄 아는 사용자들에게 더욱 쉽게 데이터를 접근할 수 있게 해준다.

# sqldf는 SQL명령이 주어지면 자동으로 스키마를 생성하고 데이터를 테이블로 로딩한 뒤
# SQL문을 수행한다. SQL의 실행 결과는 다시 R로 로딩된다. 이러한 작업은 자동으로 이루어지
# 기 때문에 사용자가 힘들여 데이터베이스를 설치하고 환경을 설정하는 작업이 필요없다. 또한
# 성능 최적화가 최대한 이루어진 데이터 베이스기술을 활용하게 되어 데이터 처리 성능또한
# 상당히 우수하다.
# sqldf를 사용하기 위해서 다음과 같이 패키지를 설치한다.

install.packages ("sqldf")
library(sqldf)

# sqldf()를 사용해 iris 데이터를 살펴보자. iris에는 세종류의 붓꽃 종류가 저장되어 있으며
# 붓꽃 종은 Species 열에 저장되어 있다. 이를 확인해보자.
head(iris)

data = sqldf("select distinct Species from iris")
class(data)
data
# .(Dot)을 필드명으로 인식하지 못한다. 반드시 `(키보드 숫자 1 옆의 문자)로 감싸야 한다.
sqldf("select `Sepal.length` from iris where Species='setosa'")
sqldf("select avg(`Sepal.length`) from iris where Species='setosa'")
mean(subset(iris , Species == "setosa" )$Sepal.Length)

sqldf("select sum(`Sepal.Length`) from iris where Species='setosa' and `Sepal.Length`>= 4")

sqldf("select `species`, avg(`sepal.length`) 'sepal.length avg' from iris group by `species`")

sapply(split(iris$Sepal.Length , iris$Species), mean)


data()
head(cars)
# cars 데이터의 speed항목에 대한 합, 평균, 최대, 최소 값을 구하라
summary(cars)
speed = sqldf("select sum(`speed`) as sum, avg(`speed`), min(`speed`), max(`speed`) from cars")
str(speed)
speed[1]
speed['sum']


# plyr은 데이터를 분할하고(split), 분할된 데이터에 특정 함수를 적용한 뒤(apply), 그 결과를
# 재 조합(combine)하는 세 단계로 데이터를 처리하는 함수들을 제공한다. 
# plyr의 입력은 배열, 데이터 프레임, 리스트가 될 수 있다. 
# 출력 역시 배열, 데이터 프레임, 리스트가 될 수 있으며 또는 아무런 결과도 출력하지 않을 수 있다.
# plyr은 이처럼 데이터의 분할, 계산, 조합을 한번에 처리해 주어 여러 함수로 처리해야할 일
# 들을 짧은 코드로 대신해준다. 뿐만아니라 입력과 출력에서 다양한 데이터 타입을 지원해주어
# 데이터 변환의 부담을 크게 덜어준다.

# plyr의 데이터 처리 함수들은 ??ply 형태의 5글자 함수명으로 이름지어져 있다. 
# 첫번째 글자는 입력 데이터 타입에 따라 각각 배열(a), 데이터 프레임(d), 리스트(l)로 정해진다. 
# 두번째 글자는 출력 데이터 타입으로서 마찬가지로 a, d, l 또는 _로 정해지는데 이 중 _은 아무런
# 출력도 내보내지 않음을 뜻한다.
iris[, 1:4]
apply(iris[, 1:4] , 1, function(row) { print(row) })

install.packages ("plyr" )
library(plyr)

# a : array, d : data.frame
# adply()는 인자로 (데이터, margin, 함수)를 입력으로 받는데, margin=1은 행방향, margin=2
# 는 열방향으로 데이터를 처리함을 뜻한다.
adply(iris, 1, function(row) { row$Sepal.Length >= 5.0 & row$Species == "setosa"})

fn = function(row) { 
  data.frame(sepal_ge_5_setosa=c(row$Sepal.Length >= 5.0 & row$Species == "setosa"))
}
data = adply(iris, 1, fn)
head(data[,c(1,5,6)])
class(data)

# cars 데이터의 speed항목에 대하여 10미만 low, 10~20 mid , 20이상 high를 출력하시오
speed = 25
ifelse(speed<10, 'low', ifelse(speed<20, 'mid', 'high'))

fn = function(row) { 
  data.frame(check=ifelse(row$speed<10, 'low', ifelse(row$speed<20, 'mid', 'high')))
}
data = adply(cars, 1, fn)
head(data)
tail(data)

# ddply()
# ddply()는 데이터 프레임(d)을 입력으로 받아 데이터 프레임(d)을 내보내는 함수이므로 이름이
# ddply()로 명명되었다. ddply()는 인자로 데이터, 데이터를 그룹 지을 변수명, 데이터 처리에
# 사용할 함수를 받는다.
# 다음은 iris 데이터에서 Sepal.Length의 평균을 Species 별로 계산하는 예이다. 두번째 인자
# 인 데이터를 그룹짓는 변수는 .( ) 안에 기록한다.

sub_fn = function(sub) {
  data.frame(
    sepal.width.mean =mean(sub$Sepal.Width),
    sepal.length.mean =mean(sub$Sepal.Length)
  )
}
ddply(iris, .(Species), sub_fn)

# 여러 변수들로 그룹을 짓고자 한다면 .( ) 안에 조건들 또는 필드명들을 나열하면 된다.
ddply(iris, .(Species, Sepal.Length>5.0), sub_fn)

head(baseball)
dim(baseball)

# 데이터의 각 행에는 선수(id 컬럼)가 해당 년도(year 컬럼)에 기록한 성적이 들어있다. 
# 다음은 선수 ansonca01의 기록을 살펴본 예이다.
head(subset(baseball , id=="ansonca01" ))

# ddply()를 사용해 각 선수가 출전한 게임수의 평균을 구해보자.
game_fn = function(sub){
  mean(sub$g)
}
ddply(baseball, .(id), game_fn)

game_fn = function(sub){
  data.frame(avg = mean(sub$g), sum = sum(sub$g))
}
ddply(baseball, .(id), game_fn)

# transform(), summarise(), subset()
# 이 절에서 살펴본 예에서는 adply() 또는 ddply()에 임의의 사용자 정의 함수를 넘겨주어 분
# 석을 수행했다. 그러나 공통적으로 자주 사용되는 유형의 계산은 transform(), summarise(),
# subset()를 사용해 보다 간단히 표현 할 수 있다.

# transform()
# base::transform()은 변수값에 대한 연산결과를 데이터 프레임의 다른 변수에 저장하는 함수이다.
# 이를 사용해 baseball 데이터에 각 행이 선수의 몇년차 통계인지를 뜻하는 cyear 컬럼을
# 추가해보자. 
# 다음 코드는 데이터를 선수 id 로 분할 한 뒤, 선수별 분할에서 
# year의 최소값과 현재 행의 year 값의 차이를 cyear에 저장한다.
head(baseball)
head(ddply(baseball , .(id), transform , cyear=year - min(year) + 1))

# plyr 에는 transform()을 개선한 plyr::mutate() 함수가 있다. 이 함수는 여러 컬럼을 데이터
# 프레임에 추가할 때 바로 앞서 추가한 컬럼을 뒤에 추가하는 컬럼에서 참조할 수 있어 편리하다.

head(ddply(baseball , .(id), transform , cyear=year - min(year) + 1, log_cyear=log(cyear)))
head(ddply(baseball , .(id), mutate , cyear=year - min(year) + 1, log_cyear=log(cyear)))

# summarise()
# plyr::summarise()는 데이터의 요약 정보를 만드는데 사용하는 함수이다. 
# transform()이 인자로 주어진 계산 결과를 새로운 컬럼에 추가한 데이터 프레임을 반환하는 반면 
# summarise() 는 계산 결과를 담은 새로운 데이터 프레임을 반환한다.
head(ddply(baseball , .(id), summarise , cyear=year - min(year) + 1))
head(ddply(baseball , .(id), summarise , minyear=min(year), maxyear=max(year)))

# subset()
# 그 이름에서 쉽게 알 수 있듯이 subset()은 각 분할별로 데이터를 추출하는데 사용한다.
# 다음은 각 선수별로 최대 게임을 플레이한 해의 기록을 추출한다.
head(ddply(baseball , .(id), subset , g==max(g)))
head(ddply(baseball , .(id), subset , g==min(g)))

# m*ply()
# m*ply(), 즉 maply(), mdply(), mlply(), m_ply() 함수는 
# 데이터 프레임 또는 배열을 인자로 받아 
# 각 컬럼을 주어진 함수에 적용한 뒤 그 실행 결과들을 조합한다.
df <- data.frame(mean =1:5 , sd =1:5)
df

# mdply()를 사용하면 위 데이터 프레임의 각 행을 rnorm() 함수의 mean, sd에 대한 인자로
# 넘겨주어 실행한 뒤 그 결과를 데이터 프레임으로 모을 수 있다. 
# 다음 예에서는 각 mean, sd 값에 대해 2개씩 난수를 발생시켰다.
mdply(df, rnorm , n=2)

# reshape2 패키지 
# reshape2(http://had.co.nz/reshape/)는 데이터의 모양을 바꾸는데 사용하는 함수이다.
# reshape2가 제공하는 변환은 크게 melt, cast 이며 이 두가지 변환을 사용해 데이터의 모양을
# 바꾸거나, 데이터를 요약할 수 있다.

install.packages ("reshape2" )
library(reshape2)

# french_fries 데이터는 세가지 종류의 오일을 사용하여 프렌치 프라이를 만들었을 때 
# 프렌치 프라이의 맛이 어떻게 달라지는가를 측정한 결과를 담고 있다.
str(french_fries)
head(french_fries)

# melt() 함수는 인자로 데이터를 구분하는 식별자(id), 측정 대상 변수, 측정치를 받아 데이터를
# 간략하게 표현한다.
# 측정 변수명은 ‘variable’, 측정치는 ‘value’에 저장되는 것이 melt()의 특징이다.
# 열을 행으로 붙여준다. ‘variable’에는 열이름이 들어가고, ‘value’에는 값이 들어간다.
m <- melt(id=1:4 , french_fries)
head(m)

m <- melt(id=1:3 , french_fries)
head(m)

# 좀 더 간단한 사례로 smiths 데이터를 살펴보자. smiths 데이터는 id가 subject, time이며
# 나머지는 측정치이다. 측정치에는 NA로 기재된 결측치가 존재한다.

smiths

m2 <- melt(id=1:2 , smiths)
head(m2)

m2 <- melt(id=1:2 , smiths, na.rm = T)
head(m2)


# complete.cases() 함수는 해당 행의 모든 값이 NA가 아닌 경우 TRUE,
# 해당 행의 값이 하나라도 NA를 갖고 있는 경우 FALSE를 반환한다.
french_fries[! complete.cases (french_fries), ]

# cast()는 결과로 얻고자하는 데이터 타입에따라 dcast(), acast()로 구분하여 사용한다. dcast()는
# 결과로 데이터 프레임을 반환하며, acast()는 벡터, 행렬, 배열을 반환한다.


# dcast()의 첫번째 인자는 melt()를 사용해 변환된 데이터(molten data)이며 두번째 인자는
# 데이터 변환 규칙을 지정한 formula이고 세번째 인자는 요약치를 계산할때 사용할 함수이다.
# cast 함수의 formula는 다음과 같이 작성한다.
# • “행 변수 ∼ 열 변수”형태로 적는다. “∼” 앞에 나열된 변수들은 행으로 지정되며, “∼”
#    뒤에 적은 변수들은 열에 배열된다.
# • 아무 변수도 지정하지 않으려면 . 를 적는다.
# • formula에 나열되지 않은 모든 변수를 표현하려면 ... 를 적는다.
smiths
m2 <- melt(id=1:2 , smiths)
m2

c1 = dcast(m2, subject + time ~ ...)
c1
identical(c1, smiths)

dcast(melt(id=1:2 , smiths , na.rm=TRUE), subject + time ~ ...)


# data.table 패키지
# 데이터 테이블은 R의 기본 데이터 타입인 데이터 프레임을 대신하여 사용할 수 있는 더
# 빠르고 편리한 데이터 타입이다.
install.packages ("data.table" )
library(data.table)

# 데이터 테이블은 데이터 프레임을 만드는 것과 동일한 문법으로 생성한다. 또는 데이터 프레
# 임과 데이터 테이블간 as.data.frame() 또는 as.data.table()를 사용해 상호 변환해도 된다.

iris_table <- as.data.table(iris)
class(iris)
class(iris_table)
iris
iris_table
iris_table[1:10,]
print(iris_table, nrows=Inf)

dt = data.table(x=c(1, 2, 3), y=c(" a" , " b" , " c" )) 
dt
str(dt)
class(dt)

dt2 = data.table(x=1:10, y=letters[1:10], z=LETTERS[1:10])
dt2
df2 = data.frame(x=1:10, y=letters[1:10], z=LETTERS[1:10])
df2

class(letters)
letters
LETTERS
# 데이터 테이블들의 목록은 table()로 열람할 수 있다.
tables ()

# 데이터 접근과 그룹 연산
# 데이터 테이블의 데이터는 [행, 표현식, 옵션] 형태로 접근한다. 행은 ‘행번호’ 또는 ‘행을
# 선택할지를 나타내는 진리값’으로 지정한다. 이는 데이터 프레임과 동일하다.

DT <- as.data.table (iris)
tables()
DT[1,]
DT[1:5,]
DT[1:5, c(1:2, 5)]
DT[DT$Species == "setosa" ,]
iris[iris$Species == "setosa" ,]
DT[1, Sepal.Length]
DT[1, list(Sepal.Length , Species)]
DT[, mean( Sepal.Length )]
DT[, mean( Sepal.Length - Sepal.Width)]

# 그러나 데이터 테이블의 두번째 인자로 컬럼 이름을 담은 문자열 또는 컬럼 번호를 지정
# 하고자 한다면 with=FALSE 옵션을 주어야한다. 그렇지 않으면 두번째 인자로 지정한 문자열
# 또는 컬럼 번호를 그대로 ‘연산식’ 취급해버리기 때문이다.
iris[1, 1]
DT[1, 1]
DT[1, 1, with=F]
DT[1, 1, with=T]

# 데이터 테이블의 세번째 인자에는 데이터를 그룹지을 변수를 지정할 수 있다.
DT[, mean( Sepal.Length )]
DT[, mean( Sepal.Length ), by="Species" ]

# 그룹화할 변수가 여러개라면 by 에 컬럼명을 계속 나열하면 된다
DT2 = data.table(x=1:5, y=rep(c("a","b"),c(3,2)), z=rep(c("c","d"),c(2,3)) )
DT2
DT2[, mean(x), by="y,z"]

# R에서 난수 만들기의 기본 함수는 runif 입니다. 
# runif () 에서 () 안에 원하는 수의 난수를 형성하도록 할 수 있습니다. 
# 만드는 난수는 기본적으로 0과 1 사이의 임의의 수입니다. 
runif(3)
runif(8)
set.seed(1234)
runif(8)
set.seed(123)
runif(8)
set.seed(1234)
runif(8)

rep(LETTERS[1:4] , times=3)
rep(LETTERS[1:4] , each=3)

# key를 사용한 탐색
# 데이터 프레임에서 특정 컬럼에 특정 값이 들어있는 행을 찾는 작업은 모든 행의 값을 하나하나
# 검토하는 방식으로 이루어진다. 따라서 데이터 양이 많고 데이터 검색 작업의 횟수가 많다면
# 긴 수행시간이 걸린다

DF3 <- data.frame(x=runif (26000000) , y=rep(LETTERS , each =1000000))
dim(DF3)
head(DF3)
tail(DF3)
# system.time()을 사용 총 수행시간(elapsed time)
system.time(x <- DF3[DF3$ y=="C", ])

DT3 <- as.data.table (DF3)
setkey(DT3 , y)
system.time(x <- DT3[J("C"), ])
# 여러 컬럼을 키로 만들어 두어야한다면 setkey(DT, 컬럼1, 컬럼2, ...) 형태로 
# 다수의 키를 지정할 수 있으며 J(컬럼1, 컬럼2, ...) 형태로 키를 나열해 데이터를 검색하면 된다.
DT3
# y값이 C인 데이터의 x값 평균
DT3[J("C"),  mean(x)]

# ist()안에 표현식을 나열해 컬럼이름을
# 지정할 수 있다. 다음은 y값이 C인 행들에서 x의 평균과 표준편차를 계산한 예이다.
DT3[J("C"),  list(avg=mean(x), sd = sd(x))]

# key를 사용한 데이터 테이블 병합
# key는 여러 데이터 테이블의 병합에도 사용할 수 있다. 예를 들어 DT1, DT2의 두개 데이터
# 테이블이 있을때 DT1[DT2, 표현식]는 DT1에서 DT2에 대응되는 데이터를 찾는 방식으로 데
# 이터를 병합한다.

DT4 <- data.table(x=runif (260000) , y=rep(LETTERS , each =10000))
DT5 <- data.table(y=c("A" , "B" , "C" ), z=c("a" , "b" , "c" ))
DT4
DT5
# DT4[DT5, ]는 DT4으로부터 y값이 A, B, C인 행을 찾아 병합한다.
setkey(DT4 , y)
DT4[DT5, ]

DT6 <- data.table(y=c("A" , "B" , "C" ), z=c("red" , "green" , "blue" ))
DT6
DT4[DT6, ]



# 참조를 사용한 데이터 수정
# 데이터 테이블은 데이터 프레임이 지원하는 일반적인 데이터 수정 연산외에도 := 연산자를
# 사용한 데이터 수정 기능을 제공한다. 방식은 DT[i, 변수명 := 값]의 형태이다.

m = matrix (1, nrow =1000 , ncol =100) # row : 1000 * col : 100
m
dim(m)
DF <- as.data.frame (m) # data.frame
DT <- as.data.table (m) # data.table
DF
DT
# update
system.time(
  for(i in 1:1000){
    DF[i, 1] = i
  }
)
DF[1:7, 1]

system.time(
  for(i in 1:1000){
    DT[i, v1 := i]
  }
)
DT[1:7, 1]


# rbindlist

# lapply()를 비롯해 많은 R 함수들이 결과를 리스트로 반환한다. 
# 리스트를 반환값으로 채택한 이유중 하나는 아마도 결과값의 데이터 타입을 다양하게 설정할 수 있다는
# 점 때문일 것이다.
x <- list ()
x
x[[1]] <- c(1, 2, 3)
x
names(x[[1]]) <- c(' x' , ' y' , ' z' )
x
x[[2]] <- c(1, 2)
x
names(x[[2]]) <- c(' x' , ' y' )
x

















