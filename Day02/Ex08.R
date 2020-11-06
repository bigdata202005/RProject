# 벡터 연산
# 벡터 연산(Vectorized Computation 또는 Array Programming)은 벡터 데이터 타입을 지칭한
# 다기보다는 벡터 또는 리스트를 한번에 연산하는 것을 말한다. 벡터 연산이 중요한 이유는
# for문등을 사용해 값을 하나씩 처리해나가는대신 벡터나 리스트를 한번에 처리하는 것이 더
# 효율적이고 편리하기 때문이다.
rm(list = ls())
v1 = c(1:10)
v1
for(i in v1){
  cat(i^2)
  cat(' ')
}
v1^2
v1 + v1
v1 == v1
v2 = v1
v2[4:6] = c(11,22,33) 
v1
v2
v1 == v2 

v2 = sample(1:100, 10)
v2
sum(v2)
mean(v2)
median(v2) # 중앙값
median(c(1:10))
v2
ifelse(v2%%2==0 , "Even","Odd")
v3 = sample(1900:2020, 10)
v3
ifelse(v3%%400==0 | v3%%4==0 & v3%%100!=0 , "Leap","Year")

# 벡터 연산을 사용하면 데이터 프레임에 저장된 데이터 중 원하는 정보를 쉽게 얻을 수 있
# 다. 기본 원리는 데이터 프레임에 TRUE 또는 FALSE를 지정해 특정 행을 얻어올 수 있다는
# 점을 이용하는 것이다. 다음은 1행, 3행, 5행을 TRUE로 하여 해당 행들만 데이터 프레임에서
# 가져오는 예이다.
df = data.frame(x=c(1, 2, 3, 4, 5), y=c(" a" , " b" , " c" , " d" , " e" ))
df
df[c(TRUE , FALSE , TRUE , FALSE , TRUE), ]  # 벡터 연산으로 원하는 행만
df[c(1,3,5),]
df[c(F,T)]
df
df[df$x %% 2 == 0, ]


# R에서는 모든 것이 객체이다. 또 객체는 함수 호출시 일반적을 값으로 전달된다. 이를 변수에
# 대한 참조(Reference)에 의한 방식에 대비해 값에 의한 전달(Pass By Value)이라고 한다. 값으
# 로 전달된다는 말은 객체가 복사되어 함수로 전달된다는 의미이다


df2 = data.frame(a=c(1, 2, 3, 4, 5))
df2
# 일반적을 값으로 전달된다
fn = function(df2) {
    df2$a <- c(11,22,33,44,55)
    print(df2$a)
    return(df)
}
fn(df2)
df2

df3 = fn(df2)
df2
df3









