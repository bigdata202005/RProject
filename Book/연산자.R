#계산할 때 사용하는 산술 연산자
# +-*/       사칙연산
# ^ or **    제곱
# %/%        나눗셈의 몫
# %%         나눗셈의 나머지
a = 10
b = 3
a+b
b-a
a*b
a/b
a%/%b
a%%b
a^2
a**3
# ?
a = -10
b = 3
a+b
b-a
a*b
a/b
a%/%b # ? 
a%%b
a^2
a**3
# ?
-10^2
-10 ** 2
(-10)^2
(-10)^3
(-10)**2
(-10)**3

10%/%3
-10%/%3

#조건을 지정할 때 쓰는 논리 연산자
# <            작음
# <=          작거나 같음
# >            큼
# >=          크거나 같음
# ==          같음
# !=           같지 않음
TRUE
T
FALSE
F

a = 10
b = 20
a == b
a != b
a < b
a <= b
a > b
a >= b

# |            OR 연산자 (요소)
# &            AND 연산자 (요소)
# ||           OR 연산자 
# &&           AND 연산
# %in%     매칭확인

T | T
T | F
F | T
F | F

T || T
T || F
F || T
F || F

T & T
T & F
F & T
F & F

T && T
T && F
F && T
F && F

v1 = 1:10
v1
v1 <= 5
? rep
v2 = rep(0:2, 3)
v3 = sample(0:1, 9, replace = T)
v2
v3
v2 && v3
v2 & v3
v2 || v3
v2 | v3

v4 = sample(1:100, 10)
v4
5 %in% v4
x = sample(1:100, 1)
x
x %in% v4
for(i in v4){
  cat(i)
  cat(' ')
}
for(i in v4){
  cat(10 %in% i)
  cat(' ')
}

