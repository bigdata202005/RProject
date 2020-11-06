# 타입 판별
# 데이터를 처리하기 위해 여러 함수를 호출하다보면 반환된 결과의 타입이 
# 무엇인지 분명하지 않을때가 있다. 
# 이때는 다음과 같이 class()를 사용할 수 있다.
# 벡터는 numeric(숫자)이라고 class가 반환되었는데, 벡터에 저장된 데이터 타
# 입에 따라 이 값은 logical, character, factor 등이 될 수 있다.
v1 = 1:10
str(v1)
class(v1)

# is.factor, is.numeric (숫자 벡터), is.character(문자열 벡터),
# is.matrix, is.data.frame 등의 ‘is.*’ 형태의 함수들을 사용해 
# 데이터의 타입을 확인 할 수 있다.
is.vector(v1)
is.integer(v1)
is.numeric(v1)

# 타입 변환
# 타입간의 변환은 각 타입에 인자로 변환할 데이터를 넘기거나, ‘as.*’ 종류의 함수를
# 사용하여 수행할 수 있다.
v2 = as.character(v1)
v2
str(v2)
class(v2)
is.vector(v2)
is.character(v2)

df = data.frame(matrix(c(1, 2, 3, 4), ncol =2))
is.data.frame(df)
df
mat = as.matrix(df)
is.matrix(mat)
mat

list1 = list(x=1:26)
list1
class(list1)
is.list(list1)

v3 = unlist(list1)
v3
class(v3)
is.vector(v3)

# 리스트를 벡터로 변경시 주의하라
v4 = as.character(list1[1])
v4
class(v4)
is.vector(v4)
length(v4)

v5 = as.character(list1[[1]])
v5
class(v5)
is.vector(v5)
length(v5)


f1 = factor(c("m","f"))
f1
is.factor(f1)

v6 = as.numeric(f1)
v6
is.vector(v6)
length(v6)

# 한번에 처리가 가능함
v7 = as.numeric(as.factor(c('m','f')))
v7
is.vector(v7)
length(v7)

df2 = data.frame(list(x=c(1, 2), y=c(3, 4)))
is.data.frame(df2)
df2

mat2 = as.matrix(data.frame(list(x=c(1, 2), y=c(3, 4))))
is.matrix(mat2)
mat2
