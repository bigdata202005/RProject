# NA의 처리
x = NA

x + 1
x - 1
x * 1
x / 1

v1 = sample(1:100,10,replace = T)
v1
v1[c(3,7)] = NA
v1
sum(v1)
sum(v1, na.rm = T)
length(v1)
mean(v1, na.rm = T)
summary(v1)

#-------------------------------------------------
# na.omit, na.pass, na.fail
#-------------------------------------------------
x <- data.frame(a=c(1, 2, 3), b=c(" a" , NA , " c" ), c=c(" a" , " b" , NA))
x
#   a    b    c
# 1 1    a    a
# 2 2 <NA>    b
# 3 3    c <NA>

# na.omit은 NA가 포함된 행을 제외
na.omit(x)
#   a  b  c
# 1 1  a  a

# na.pass는 NA의 포함여부를 상관하지 않음
na.pass(x)
#   a    b    c
# 1 1    a    a
# 2 2 <NA>    b
# 3 3    c <NA>

# na.fail은 데이터에 NA가 포함되어있을 경우 에러를 내보냄
na.fail(x)
# Error in na.fail.default(x) : 객체안에 결측값들이 있습니다

