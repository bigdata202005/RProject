# sapply()
# sapply()는 lapply()와 유사하지만 
# 리스트대신 행렬, 벡터 등으로 결과를 반환하는 함수이다.
# 입력으로는 벡터, 리스트, 데이터 프레임등이 쓰일 수 있다.

list1 = lapply(iris[, 1:4] , mean)
list1
class(list1)

v1 = sapply(iris[, 1:4] , mean)
v1
class(v1)

# sapply()에 의해 반환된 벡터는 
# as.data.frame()을 사용해 데이터 프레임으로 변환할 수 있다. 
# 이 때, t(x)를 사용해 벡터의 행과 열을 바꿔주지 않으면 기대한 것과 
# 다른 모양의 데이터 프레임을 얻게되므로 이를 참고하기 바란다.

df1 = as.data.frame(v1)
df1
class(df1)

df2 = as.data.frame(t(v1))
df2
class(df2)

# 또한 sapply()를 각 열에 저장된 데이터의 클래스를 알아내는데 사용할 수 있다.
sapply(iris, class)
sapply(iris[,1:4], class)

df3 = as.data.frame(t(sapply(iris[,1:4], sum)))
df3
# 값이 3보다 큰지 논리값을 리턴 10줄 4칸
df4 = as.data.frame(sapply(iris[1:10, 1:4] , function(x) { x > 3 }))
df4



