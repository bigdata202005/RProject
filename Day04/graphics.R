# graphics 패키지는 R의 가장 기본이 되는 시각화 기능을 지원한다. 
# 전체 함수의 목록은 library(help = ‘graphics’)를 통해 볼 수 있으며 
# 여기서는 가장 자주 사용되는 함수들에 대해서 설명한다.
library(help = 'graphics')

# 1. 산점도
# 산점도는 주어진 데이터를 점으로 표시해 흩뿌리듯이 시각화한 그림이다. 
# R에서 산점도는 plot() 함수로 그리는데, plot()은 산점도 뿐만 아니라 
# 일반적으로 객체를 시각화하는데 모두사용될 수 있는 일반 함수(Generic Function)이다.
methods('plot')

# mlbench 패키지
# UCI repository를 포함한 다양한 머신 러닝 벤치 마킹을 위한 데이터가 있는 패키지이다.
install.packages("mlbench")
library("mlbench")
# data() 문은 mlbench 패키지 로딩뒤 Ozone데이터 셋을 읽어들이기 위해 사용
data(Ozone)
# Ozone의 V8과 V9변수는 각각 캘리포니아 Sandburg와 El Monte에서 매일 측정한 온도이다.
# Ozone 데이터에 들어있는 각 필드의 설명은 ?Ozone 또는 help(Ozone)명령으로 볼 수 있다.

# plot은 (x, y)의 순서로 입력을 받으며, x와 y가 숫자형 데이터의 경우 산점도를 그려준다.
plot(Ozone$ V8 , Ozone$ V9)
head(Ozone)

# 축이름지정
plot(Ozone$ V8 , Ozone$ V9 , 
      xlab="Sandburg 온도" ,
      ylab="El Monte 온도" )

# 그래프 제목(main) main 파라미터로 지정한다.
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도")

# 점의 종류(pch)
# 그래프에 보이는 점은 모양은 pch 로 지정하는데 pch에 숫자를 지정하면 미리 지정된 심볼이
# 사용되고 문자(예를들어 ‘+’)를 지정하면 그 문자를 사용해 점을 표시한다.

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch='+')

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch='*')

# r pch symbols 검색하여 번호로도 지정가능
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23)

# 점의 크기(cex) : 산점도에 보인 점의 크기는 cex로 조정할 수 있다. 
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=0.1)

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5)

# 색상(col) : 색상은 col 파라미터로 RGB값을 각각 두자리씩 지정한다. 
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, col='#FF0000')

colors()  # 색상목록
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, col='tomato4')

#  축색상/라벨색상
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, 
     col='tomato4', col.axis='steelblue1', col.lab='seagreen4')

# 좌표축 값의 범위(xlim, ylim)
# 필요하다면 그래프에 그려질 x 값의 범위, y값의 범위를 바꿔볼 수 있다. 
# x축과 y축 각각 xlim, ylim을 사용하며 c(최소값, 최대값)의 형태로 각 인자에 값을 지정하면 된다. 

max(Ozone$V8)
max(Ozone$V8, na.rm = T)
min(Ozone$V8)
min(Ozone$V8, na.rm = T)

max(Ozone$V9, na.rm = T)
min(Ozone$V9, na.rm = T)

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, 
     col='tomato4', col.axis='steelblue1', col.lab='seagreen4',
     xlim=c(25,93), ylim=c(27,83)
)

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, 
     col='tomato4', col.axis='steelblue1', col.lab='seagreen4',
     xlim=c(1,100), ylim=c(1,100)
)

plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg 온도" ,
     ylab="El Monte 온도" ,
     main="도시별온도",
     pch=23, cex=1.5, 
     col='tomato4', col.axis='steelblue1', col.lab='seagreen4',
     xlim=c(50,100), ylim=c(50,100)
)

# type
# type을 설명하기위해 잠깐 cars 데이터셋에 알아보자. 
# cars 데이터는 차량이 달리던 속도, 그리고 그 속도에서 브레이크를 잡았을때 
# 제동거리를 측정한 데이터이다.
data(cars)
head(cars)

plot(cars)
plot(cars, xlab="속도", ylab="이동거리")
plot(cars, xlab="속도", ylab="이동거리", main="제동거리")

# type="l" : line graph 
plot(cars, xlab="속도", ylab="이동거리", main="제동거리", type="l")
# type="o" : line graph , 산점도
plot(cars, xlab="속도", ylab="이동거리", main="제동거리", type="o", cex=2.5)

# speed마다 평균dist를 tapply를 사용해 계산한다음, 이를 plot()하면 된다.
tapply(cars$ dist , cars$ speed , mean)
data = tapply(cars$ dist , cars$ speed , mean)
class(data)
data
plot(data, xlab="속도", ylab="이동거리", 
     main="제동거리", type="o", cex=2.5, cex.main=3.0, cex.lab=2.0,
     col='tomato4', col.axis='steelblue1', col.lab='seagreen4', col.main='red'
     )

# 자세한 옵션은 ?par로 검색해서 참조하시오
? par



