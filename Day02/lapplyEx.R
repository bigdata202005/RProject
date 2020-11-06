# lapply()
# lapply()는 lapply(X, 함수)의 형태로 호출하며 
# 이때 ‘X’는 벡터 또는 리스트이고, 
# ‘함수’는 ‘X’내 각 요소에 적용할 함수이다. 
# 함수를 적용한 결과는 리스트로 반환된다.
? lapply
data = 1:3
data
result = lapply (data , function(x) { x*2 })
result
class(result)
for(i in result){
  cat(i)
  cat(' ')
}

# cars 데이터의 speed에 대하여 제곱한 값을 리턴하도록 하시오!!!
speed = cars$speed
class(speed)
result = lapply (speed , function(x) { x**2 })
result
result2 = cbind(speed, result)
result2

gugu = matrix(1:9)
gugu[,1]
for(i in 2:9)  {
  dan = lapply(gugu[,1], function(x) { x*i })
  gugu = cbind(gugu, dan)
}
gugu

# 리스트로 나온 결과를 다시 벡터로 변환하고 싶을때가 많다. 
# 이때 사용할 수 있는 한가지 방법은 unlist()를 호출하는 것이다.
data = 1:3
data
result = lapply (data , function(x) { x*2 })
result
class(result)
v1 = unlist(result)  # 리스트를 벡터로
v1
class(v1)

list1 = list(a=1:3 , b=4:6)
list1
list1$a
list1$b
s = lapply(list1, mean)
a = lapply(list1, sum)


d = as.data.frame (matrix(unlist(lapply(iris[, 1:4], mean)), ncol=4, byrow=TRUE))
d
names(d) = names(iris[, 1:4])
d

list2 = lapply(iris[, 1:4], mean)
list2
class(list2)
v2 = unlist(list2)
v2
m2 = matrix(v2, ncol = 4, byrow = T)
m2
class(m2)
df = as.data.frame(m2)
df
class(df)
names(iris[, 1:4])
names(df) = names(iris[, 1:4])
df

# 또는 do.call()을 사용할 수도 있다. 
# 형식은 ‘do.call(호출할 함수, 파라미터)’와 같은 방식이다. 

do.call("complex", list(imag = 1:3))
do.call(function(x){return(x*2)}, list(x=1:10))
data = do.call(function(x){return(x**2)}, list(x=1:10))
data
class(data)
str(data)
data_frame = data.frame(data)
data_frame
class(data_frame)


df3 = data.frame(do.call(cbind , lapply(iris[, 1:4], mean)))
df3
class(df3)

list3 = lapply(iris[, 1:4], mean)
list3
class(list3)
? do.call
m3 = do.call(cbind, list3)
m3
class(m3)
df4 = data.frame(m3)
df4
class(df4)

# -----------------------------------------------------------------
df_data1 = data.frame(name='foo', value=1)
df_data1
class(df_data1)

df_data2 = data.frame(name='bar', value=2)
df_data2
class(df_data2)

list4 = list(df_data1,df_data2)
list4
class(list4)

v4 = unlist(list4)
v4
class(v4)

m4 = do.call(rbind, list4)
m4
class(m4)
