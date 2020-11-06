# 그래프의 배열(mfrow)
# mfrow를 지정하면 한 창에 여러개의 그래프를 나열할 수 있다. 
# mfrow를 지정하는 형식은 par(mfrow =c(nr, nc))이며 
# nr은 행의 수, nc는 열의 수를 뜻한다. 
# 다음에 보인 코드에서는 mfrow=c(1, 2)를 지정하여 
# 한 창에 그래프를 1행 2열로 배치하였다.

# par() 문에 mfrow를 지정하면 이전에 저장된 par 설정이 반환된다. 
# 코드의 마지막에서 par(opar)를 수행함으로써 mfrow 지정 이전의 par 설정으로 되돌렸다. 

# 이전 설정 저장하기
opar <- par(mfrow=c(1, 2))
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg Temperature" ,
     ylab="El Monte Temperature" , 
     main="Ozone" )
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg Temperature" ,
     ylab="El Monte Temperature" , 
     main="Ozone2" )
# 이전 설정으로 복원하기
par(opar)
opar <- par(mfrow=c(2, 1))
plot(Ozone$ V8 , Ozone$ V9 , 
     xlab="Sandburg Temperature" ,
     ylab="El Monte Temperature" , 
     main="Ozone" )
plot(Ozone$ V8 , Ozone$ V9 , type='o',
     xlab="Sandburg Temperature" ,
     ylab="El Monte Temperature" , 
     main="Ozone2" )
# 이전 설정으로 복원하기
par(opar)

# 지터(jitter)
# Jitter는 데이터 값을 조금씩 움직여서 같은 점에 데이터가
# 여러번 겹쳐서 표시되는 현상을 막는다.
opar <- par(mfrow=c(1, 2))
plot(Ozone$ V6 , Ozone$ V7 , 
     xlab=" Windspeed" , ylab=" Humidity" ,
     main=" Ozone" , pch=20, cex=.5)

plot(jitter(Ozone$ V6), jitter(Ozone$ V7),
     xlab=" Windspeed" , ylab=" Humidity" ,
     main=" Ozone" , pch=20, cex=.5)
par(opar)


# 점(points)
# points()는 점을 그리기 위한 함수이다. plot()을 연달아 호출하는 경우 매번 
# 새로운 그래프가 그려지는 것과 달리 points()는 이미 생성된 plot에 
# 점을 추가로 그려준다. 
# 다음은 iris의 Sepal.Width, Sepal.Length을 plot으로 그린 뒤 
# Petal.Width, Petal.Length을 같은 그래프 위에 덧 그리는 코드이다.

plot(iris$ Sepal.Width , iris$ Sepal.Length , cex=.5 , pch=20,
       xlab="width" , ylab="length" , main=" iris" )

points(iris$ Petal.Width , iris$ Petal.Length , cex=.5 ,
           pch="+" , col="#FF0000" )


# 제일 처음 plot() 문을 수행할 때는 그래프에 표시할 데이터가 없다가, 
# 이후 points() 명령을 수행할 시점에 표시할 데이터가 준비될 경우가 있다. 
# 이럴때는 type=“n”을 사용하여 plot()을 수행한다. 
# 그러면 화면에 그려지는 데이터는 없으나 새로운 plot을 시작하여 points() 호출이
# 가능해진다.

plot(NULL , xlim=c(0, 5), ylim=c(0, 10),
     xlab=" width" , ylab=" length" , main="iris")
points(iris$Sepal.Width , iris$Sepal.Length , cex=.5 , pch =20)
points(iris$Petal.Width , iris$Petal.Length , cex=.5 , pch="+" , col="#FF0000" )


with(iris , {
  plot(NULL , xlim=c(0, 5), ylim=c(0, 10),
       xlab=" width" , ylab=" length" , main="iris")
  points(Sepal.Width , Sepal.Length , cex=.5 , pch =20)
  points(Petal.Width , Petal.Length , cex=.5 , pch="+" , col="#FF0000" )
})

with(iris , {
  plot(NULL , xlim=c(0, 5), ylim=c(0, 10),
       xlab=" width" , ylab=" length" , main="iris", type="n")
  points(Sepal.Width , Sepal.Length , cex=.5 , pch =20)
  points(Petal.Width , Petal.Length , cex=.5 , pch="+" , col="#FF0000" )
})


# 선(lines)
# lines()는 points()와 마찬가지로 plot()으로 새로운 그래프를 그린 뒤 
# 선을 그리는 목적으로 사용된다.
x <- seq(0, 2*pi , 0.1)
y <- sin(x)
plot(x, y, cex=.5 , col="red")
lines(x, y)

head(cars)
plot(cars)
lines(cars)

# lowess : 자료의 추세를 보여주는 선
plot(cars)
lines(lowess(cars))

# 직선(abline)
# abline은 y = a + bx 형태의 직선, 또는 y = h 형태의 가로로 그은 직선, 
# 또는 x = v 형태의 세로로 그은 직선을 그래프에 그린다.
plot(cars , xlim=c(0, 25))
abline(a=-5, b=3.5 , col="red" )
abline(a=-5, b=6 , col="red" )

# lty는 선의 유형을 지정하는데 사용되며 2는 dashed line을 뜻한다.
abline(h=mean(cars$dist), lty=2, col="blue" )
abline(v=mean(cars$speed), lty=2, col="green" )
abline(v=5, lty=2, col="red" )
abline(h=55, lty=2, col="red" )

# 곡선(curve) : curve는 주어진 표현식에 대한 곡선을 그리는 함수
opar <- par(mfrow=c(2, 1))
  # point, line
  x <- seq(0, 2*pi , 0.1)
  y <- sin(x)
  plot(x, y, cex=.5 , col="red")
  lines(x, y)
  # curve
  curve(sin , 0, 2*pi)
par(opar)

# 다각형(polygon) : polygon()은 다각형을 그리는데 사용하는 함수

# 선형 회귀
# 통계학에서, 선형 회귀는 종속 변수 y와 한 개 이상의 독립 변수 X와의 
# 선형 상관 관계를 모델링하는 회귀분석 기법이다. 
# 한 개의 설명 변수에 기반한 경우에는 단순 선형 회귀, 
# 둘 이상의 설명 변수에 기반한 경우에는 다중 선형 회귀라고 한다. 

m <- lm(dist ~ speed , data=cars)
m
# dist = −17.579 + 3.932 × speed
plot(cars)
abline(m)

# 예측은 predict()로 수행한다. 
# 함수 호출시 인자로 interval=“confidence”를 지정해 신뢰구간까지 구해보자.
p <- predict(m, interval="confidence" )
head(p)
# p는 matrix이며 ‘fit’는 회귀모형으로 적합된 값, ‘lwr’은 신뢰구간의 하한, 
# ‘upr’은 상한을 뜻한다

x <- c(cars$ speed, tail(cars$ speed , 1), rev(cars$ speed),cars$speed[1])
x
y <- c(p[, "lwr" ], tail(p[, "upr" ], 1),  rev(p[, "upr" ]), p[, "lwr" ][1])
y
polygon(x, y, col=rgb(.7 , .7 , .7 , .5))

polygon(c(10,15,18,25), c(60,70,80,80), col='red')


# 문자열(text) : text()는 그래프에 문자를 그리는데 사용하며 
#                형식은 text(x, y, labels)이다.
plot(cars)
# pos : 1(아래), 2(왼쪽), 3(위), 4(오른쪽)
text(cars$speed, cars$dist, pos=3, cex=1)
text(10,100,'title' , cex=4, col='red')


# identify()는 그래프상에서 특정 점을 클릭하면 클릭된 점과 
# 가장 가까운 데이터를 그려준다. 값들을 리턴해준다
plot(cars)
click_data = identify(cars$ speed , cars$ dist)
click_data 


# 범례(legend)
# legend()는 범례를 표시하는데 사용된다. 
# 가장 기본적인 형식은 legend(x, y=NULL, legend)인데, 
# 범례가 보여질 (x, y) 좌표를 지정할 수도 있고 사전에 정의된 
# 키워드(bottomright, bottom,bottomleft, left, topleft, top, topright, right, center) 
# 중 하나로 범례의 위치를 지정해도 된다.

plot(iris$ Sepal.Width , iris$ Sepal.Length , cex=2.5 , pch=20,
     xlab="width" , ylab="length" , main=" iris" )

points(iris$ Petal.Width , iris$ Petal.Length , cex=2.5 ,
       pch="+" , col="#FF0000" )
legend("topright" ,                           # 위치
       legend=c("Sepal" , "Petal" ),          # 범례문자
       pch=c(20, 43),                         # 범례기호
       cex=2.8 ,                              # 크기
       col=c("black" , "red" ),               # 색상
       bg="gray" )                            # 배경색



# 행렬에 저장된 데이터 그리기(matplot, matlines, matpoints)
# matplot(), matlines(), matpoints()는 각각 plot(), lines(), points() 함수와 
# 유사하지만 행렬(matrix) 형태로 주어진 데이터를 그래프에 그린다는 점에서 차이가 있다.

x <- seq(-2*pi , 2*pi , 0.01)
class(x)
is.vector(x)
head(x)
length(x)
y <- matrix(c(cos(x), sin(x)), ncol =2)
class(y)
is.matrix(y)
head(y)
dim(y)
matplot(x, y, col=c("red" , "black" ), cex=.2)
abline(h=0, v=0)



















