# 벡터내 데이터 접근
# 벡터는 [ ] 안에 인덱스를 적어서 각 요소를 가져올 수 있다. 
# 이때, 인덱스는 다른 언어와 달리 1로 시작한다.

x <- c(" a" , " b" , " c" )
x
x[1]
x[3]
# ‘-인덱스’ 와 같이 음수의 인덱스를 사용해 특정 요소만 제외할 수도 있다.
x[-2]  
# 벡터의 여러 위치에 저장된 값을 가져오려면 ‘벡터명[색인 벡터]’의 형식을 사용한다.
x[c(1,3)]
x[c(2,3)]

# ‘x[start:end]’ 를 사용해 start부터 end까지(end 포함)의 데이터를 볼 수도 있다.
x[1:3]
x[2:2]
# 벡터의 각 셀에 names()를 사용해 이름을 부여해 두었다면, 
# 이 이름을 사용해 데이터를 접근 할 수 있다.
names(x) = c("kim" , "seo" , "park" )
x
x['kim']
x['park']

names(x)[2]


# 벡터의 길이는 length() 또는 NROW() (대문자임에 주의! ) 를 통해 알 수 있다. 본래
# nrow()는 행렬(Matrix) (페이지 48)의 행의 수를 알려주는 함수이지만 nrow()의 
# 변형인 NROW()는 인자가 벡터인경우 벡터를 n행 1열의 행렬로 취급해 길이를 반환한다.
length(x)
NROW(x)
nrow(x)  # NULL

# help
? length

# %in% 연산자는 어떤 값이 벡터에 포함되어있는지를 알려준다.
x
" c" %in% x
" a" %in% c(" a" , " b" , " c" )
" d" %in% c(" a" , " b" , " c" )

# 벡터를 집합(set)으로 취급해 집합간 합집합, 교집합, 차집합을 계산할 수 있다.\
v1 = c(1,2,3,4)
v1
v2 = c(3,4,5,6)
v2
# 합집합
union(v1, v2)
# 교집합
intersect(v1, v2)
# 차집합
setdiff(v1,v2)

# 집합간 비교는 setequal()을 사용한다.
setequal(v1, v1)
setequal(v1, v2)

# seq
? seq
# seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)),length.out = NULL, along.with = NULL, ...)
s1 = seq(1,10)
s1
s2 = seq(1,10,2)
s2
s3 = seq(5,-5,-1)
s3
s4 = 1:10
s4

# rep
# 특정 값들이 반복된 벡터를 손쉽게 만드려면 rep()를 사용한다. 
# 다음은 1, 2를 총 5회 반복한 벡터를 만드는 예이다.
? rep
# rep_len(x, length.out)
rep (1:2 , 5)
rep(c(1,2), c(3,3))
rep (1:2 , each =5) 

# 리스트(List)
# 리스트는 다른언어에서 흔히 보는 해싱 또는 딕셔너리에 해당하며, 
# (키, 값) 형태의 데이터를 담는 연관 배열(associative array)이다.
x = list(name=" foo" , height =70)
x
x$name
x$height

x2 = list(name=" foo" , height=c(1, 3, 5))
x2
x2$name
x2$height
x2$height[1]
x2$height[2:3]

# 리스트 안에 리스트를 중첩하는 것이 가능하다.
x3 = list(a=list(val=c(1, 2, 3)), b=list(val=c(1, 2, 3, 4)))
x3
x3$a
x3$b
x3$b$val[2:3]
x3[1]
x3[2]
x3[[2]]



# 행렬(Matrix)
# 벡터와 마찬가지로 행렬에는 한가지 유형의 스칼라만 저장할 수 있다. 
# 따라서 모든 요소가 숫자인 행렬은 가능하지만, ‘1열은 숫자, 
# 2열은 문자열’과 같은 형태는 불가능하다.

? matrix
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)

m1 = matrix(c(1:12), nrow = 3)
m1
m2 = matrix(c(1:12), ncol = 3)
m2
m3 = matrix(c(1:12), nrow = 3, ncol = 4 )
m3
m4 = matrix(c(1:12), nrow = 3, byrow = T )
m4
m5 = matrix(c(1:12), nrow = 3, byrow = F )
m5
m6 = matrix(c(1:9), nrow = 3, dimnames = list(c(" item1" , " item2" , " item3" ),c(" feature1" , " feature2" , " feature3" )))
m6

# 행렬내 데이터 접근
# 행렬의 각 요소는 ‘행렬이름[행인덱스, 열인덱스]’로 접근할 수 있다. 
# 이 때, 인덱스는 벡터의 경우와 마찬가지로 1부터 시작한다.
m1
m1[1,1]
m1[2,3]
m2
m2[1:2, ] 
m2[,1:2]
m2[1:2, 1:2]
m3
m3[2:3,2:3]

#  인덱스를 벡터에 넣어 나열할 수도 있다. 
m3[2:3,c(1,3)]
m3[c(1,3),c(1,3)]

# dimnames를 통해 행과 열에 이름을 부여했다면 그 이름을 직접 사용할 수도 있다.
m6
m6[" item1",]
m6[, " feature2"]
m6[c(' item1', ' item3'),]
m6[c(' item1', ' item3'),c( " feature2",  " feature3")]

# 행렬의 연산
# 행렬에 스칼라를 곱하거나 나누는 연산은 일반적인 프로그래밍 언어에서 하듯이 
# * 나 / 를 사용한다.

m1
m1 + 3
m1 - 3
m1 * 3
m1 / 3

m1 = matrix(c(1:12), nrow = 3)
m2 = matrix(c(13:24), nrow = 3)
m1
m2
m1+m2
m1-m2
m1 * m2
m1 / m2

m3 = matrix(c(1:12), nrow = 4)
m1
m3
m1 %*% m3

m4  = matrix(c(1:4), nrow = 2)
m4
solve(m4)
m4 %*% solve(m4)

# 전치행렬은 t()로 구한다.
m1
t(m1)

# 행렬의 차원은 ncol() 또는 nrow(), dim() 로 알 수 있다.
m1
ncol(m1)
nrow(m1)
dim(m1)

# 배열 정의
# matrix가 2차원 행렬이라면 배열(array)은 n차원 행렬이다. 
# 예를들어 3x4 matrix는 다음과 같이 array를 사용해 표현할 수 있다.

m1 = matrix (1:12 , ncol =4)
m1
ar1 = array (1:12 , dim=c(3, 4))
ar1
ar2 = array (1:12 , dim=c(2, 2, 3))
ar2
ar3 = array(1:16, dim=c(2,1,4)) 
ar3

# 배열 데이터 접근
# 행렬의 경우와 유사한 방식으로 각 요소에 접근할 수 있다. 
# 또, 배열의 차원은 dim() 함수를 통해 알 수 있다.
ar2
ar2[,,2]
ar2[,1,2]
ar2[1,1,2]
dim(ar2)


# 데이터 프레임(Data Frame)
# 데이터 프레임은 R에서 가장 중요한 자료형이다. 
# 데이터 프레임은 행렬과 마찬가지의 모습을 하고 있지만 행렬과 달리 
# 다양한 변수, 관측치(observations), 범주 등을 표현하기 위해 특화되어있다.

# 데이터 프레임 정의
# 데이터 프레임은 data.frame() 을 사용해 정의한다.

df1 = data.frame(x = c(1,2,3,4), y=c(4,5,6,7))
df1
df2 = data.frame(x = c(1,2,3,4), y=c(4,5,6,7),z =c(8,9,10,11))
df2
# 각 열의 데이터 타입이 같다면 여러가지 데이터 타입을 혼용해서 사용할 수 있다.
df3 = data.frame(x = c(1,2,3,4), y=c(4,5,6,7),z =c(T,F,T,F))
df3
df4 = data.frame(x = c(1,2,3,4), y=c("A","B","C","D"),z =c(T,F,T,F))
df4

# 만약 이미 정의된 데이터 프레임에 새 열을 추가하고자한다면 ‘$ 열이름
df4$A = c(11,22,33,44)
df4
# 데이터 프레임 접근
# 데이터 프레임의 각 열은 $ 변수명으로 접근할 수 있으며, 
# 행이나 열의 인덱스를 사용해서도 데이터에 접근할 수 있다.

df4$A
df4$x
df4$X
df4$A[3]
df4[1,]
df4[4,]
df4[2:3,]
df4[,1:2]
df4[, c('x','A')]
df4
df4[2:3, c('x','A')]
df4[c(2,3), c('x','A')]
df4[c(2,4), c('y','z')]
# 제외할 행 또는 열을 - 로 표시할 수 있다.
df4
df4[-2,]
df4[-2,1:3]
df4[-2,c(-1,-3)]


# 위 코드에서 x 컬럼만 선택했을때는 data.frame의 일반적인 모양인 표 형태가 아닌 벡터처
# 럼 결과가 나온 것을 볼 수 있다. 이는 컬럼의 차원이 1이되면 자동으로 데이터 프레임이 아닌
# 벡터로 값을 반환하기 때문이다. 이를 피하려면 다음과 같이 drop=FALSE 옵션을 지정한다.
df4
df4[1]
df4[,c('x')]  # vector
df4[,c('x'), drop=F] # data.frame

str(df4)
str(df4[,c('x')])
str(df4[,c('x'), drop=F])

df5 = data.frame(x=1:1000)
df5
head(df5)
head(df5, 10)
tail(df5)
tail(df5, 10)

# 데이터 프레임의 행 이름, 열 이름은 각각 rownames(), colnames() 함수로 지정할 수 있다.
df6 = data.frame(1:3)
colnames(df6) <- c(' val ' )
df6
rownames(df6)=c(1,2,3)
df6
rownames(df6)=c('a','b','c')
df6
df6$val2 = c(11,22,33)
df6
colnames(df6) <- c('val1', 'val2' )
df6


# 주어진 값이 벡터에 존재하는지를 판별하는 %in% 연산자를 이용하면 특정 열만 선택하는
# 작업을 보다 손쉽게 할 수 있다. 예를들어 다음과 같이 a, b, c 열이 있는 데이터 프레임에서 b,
# c 열만 선택하는 경우를 보자.
df7 = data.frame(a=1:3, b=4:6, c=11:13)
df7
df7[, names(df7) %in% c("b" , "c" )]
names(df7)

df7[, !names(df7) %in% c("c" )]



# 데이터를 처리하기 위해 여러 함수를 호출하다보면 반환된 결과의 타입이 무엇인지 분명하지
# 않을때가 있다. 이때는 다음과 같이 class()를 사용할 수 있다.
class(c(1:10))
class(matrix(1:10, nrow = 2))
class(list(1:10))
class(data.frame(1:10))

# 또는 다음과 같이 데이터 타입을 str()문으로도 확인해 볼수 있다. 벡터와 행렬의 결과가
# 유사해보이지만 벡터의 경우 차원이 [1:2](1차원에 값이 2개)라고 표시되어있는 반면, 행렬은
# 차원이 [1:2, 1](2차원이고 2행 1열)로 표시되어 있는 점이 다르다.
str(c(1:10))
str(matrix(1:10, nrow = 2))
str(list(1:10))
str(data.frame(1:10))


# 타입 변환
# 타입간의 변환은 각 타입에 인자로 변환할 데이터를 넘기거나, ‘as.*’ 종류의 함수를 사용하여
# 수행할 수 있다. 
# 다음은 행렬을 data.frame()의 인자로 넘겨 데이터 프레임으로 형변환 하는 예이다.

df  = data.frame(matrix(c(1, 2, 3, 4), ncol =2))
df
m = matrix(c(1, 2, 3, 4), ncol =2)
class(m)
df2 = data.frame(m)
class(df2)
# 리스트를 데이터 프레임으로 변환한 예이다.
list1 = list(x=1:10, y =11:20)
list1
df3 = data.frame(list1)
df3
# as.numeric, as.factor, as.data.frame, as.matrix 등의 함수를 사용한 형 변환이 가능하다
x = c(" m" , " f" )
class(x)
x
f = as.factor(x)
class(f)
f
n = as.numeric(f)
class(n)
n
