# apply 함수들
# R에는 다양한 벡터 또는 행렬데이터에 임의의 함수를 적용한 결과를 얻기 위한 apply류의
# 함수들이 있다. 이들 함수는 벡터, 행렬, 리스트, 데이터 프레임에 적용할 함수를 명시하는 형
# 태로서, 함수형 언어 스타일에 가깝다고 볼 수 있다. 따라서 다른 언어에만 익숙한 사람들이 이
# 절에서는 이들 중 종종 사용되는 apply, lapply, sapply, tapply에 대해서 알아본다.

# apply()
# apply() 는 행렬의 행 또는 열방향으로 특정 함수를 적용하는데 사용되며, 
# apply(행렬, 방향, 함수) 형태로 호출한다. 
# 이때 ‘방향’은 1이 주어지면 행, 2가 주어지면 열을 뜻한다. 
# apply()를 수행한 결과값은 벡터, 배열, 리스트 중 적합한 것으로 반환된다. 
# 반환 값 유형에 대한 자세한 규칙은 ?apply를 참고하기 바란다.

? apply
x = cbind(x1 = 3, x2 = c(4:1, 2:5))
x
dimnames(x)[[1]] = letters[1:8]
x
apply(x, 2, mean, trim = .2)  # 세로 합

col.sums = apply(x, 2, sum)
row.sums = apply(x, 1, sum)
col.sums
row.sums

x1 = rbind(x, col.sums )
x1
x2 =cbind(x, row.sums) 
x2

# ----------------------------------------------------------
sum(1:10)
matrix1 = matrix(c(1:9), ncol=3)
matrix1
# 가로합
apply(matrix1, 1, sum)
# 세로합 
apply(matrix1, 2, sum)

matrix2 = rbind(matrix1, apply(matrix1, 2, sum) )
matrix2

matrix3 = cbind(matrix1, apply(matrix1, 1, sum) )
matrix3

head(iris)
class(iris)
head(iris[, 1:3])
apply(iris[, 1:4] , 2, sum)
apply(iris[1:10, 1:2] , 2, sum)

head(cars)
class(cars)
names(cars)
apply(cars, 2, mean)

apply(cars, 2, max)
apply(cars, 2, min)
apply(cars, 2, sd)
apply(x, 2, sort)

cave = function(x, c1, c2) c(mean(x[c1]), mean(x[c2]))
x1
x2
#     행렬, 방향, 함수, 함수의 인수들.....              
apply(x, 1, cave,  c1 = "x1", c2 = c("x1","x2"))

# 행 또는 열의 합 계산은 빈번히 사용되므로 rowSums(), colSums() 함수가 정의
# 되어있다.
head(iris)
colSums(iris)
colSums(iris[1:4])
rowSums(iris[1:10, 1:4])

# 행, 열방향의 평균역시 rowMeans() 또는 colMeans()를 통해서도 계산할 수 있다.
head(iris)
colMeans(iris)
colMeans(iris[1:4])
rowMeans(iris[1:10, 1:4])


