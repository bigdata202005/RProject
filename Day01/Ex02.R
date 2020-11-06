Numeric_Vector = c(1:20)
Chr_Vector = c("A","B","C")
# 기본적으로 저장된 데이터들의 타입은 str()명령어를 통해 확인합니다.
print(Numeric_Vector)
print(str(Numeric_Vector))  # int
print(Chr_Vector)
print(str(Chr_Vector))      # chr

# 1. as.Date()를 활용하는 경우
# 날짜가 입력된 포맷에 맞춰 옵션값에 설정을 해줘야 합니다.
DATE_O = "2018-01-02"
# 문자열을 날짜타입으로 변경
# as.Date(변수, format = “날짜 형식”)
DATE_C = as.Date(DATE_O, format = "%Y-%m-%d")

str(DATE_O)  # chr타입
str(DATE_C)  # Date타입
DATE_C
DATE_O

# as.POSIXct()를 활용하는 경우
# POSIXct는 시간:분:초까지 활용할 수가 있습니다.
# as.POSIXct(날짜, format = “날짜형식”)
DATE_O2 = "2015-02-04 23:13:23"
DATE_P = as.POSIXct(DATE_O2, format = "%Y-%m-%d %H:%M:%S")
str(DATE_P)

# format()의 활용: 날짜정보를 뽑아 새로운 변수를 만들 수 있습니다.
# format(날짜변수, “형식”)
format(DATE_P,"%A")  
format(DATE_P,"%a")  
format(DATE_P,"%S") 
format(DATE_P,"%M")
format(DATE_P,"%H") 
format(DATE_P,"%Y") 
format(DATE_P,"%m") 
format(DATE_P,"%d") 
format(DATE_P,"%Y-%m-%d(%a) %H:%M:%S") 

# as & is를 통해 strings(데이터 타입) 확인 및 변경하기
x=c(1,2,3,4,5,6,7,8,9,10) 

x1 = as.integer(x)
x2 = as.numeric(x)
x3 = as.factor(x)
x4 = as.character(x)
str(x1)
str(x2)
str(x3)
str(x4)
# summary()는 매우 자주 쓰이는 명령어이며, 데이터의 타입에 따라 결과값이 다르게 나옵니다.
summary(x1)
summary(x2)
summary(x3)
summary(x4)

# is()
# is는 논리문으로써 변수 x가 ~인지 판단하여라. 
# 라는 의미를 가집니다. 
# str()은 단순히 Stirngs를 확인하는 것이지, 
# 논리문으로 결과를 반환해주지 못합니다. 
# 그렇기에 논리조건이 필요할 때는 is.()를 써야 합니다.

is.integer(x1)
is.character(x1)


# sample()을 통한 데이터 무작위 추출하기
# 로또 번호 추첨
# 1 ~ 45 중에 6개의 숫자를 비복원 추출하겠다.
S1 = sample(1:45, 6, replace = FALSE) 
S1
S2 = sample(1:45, 6, replace = TRUE) 
S2

a=10
b=20
c = a + b
c
c = a - b
c
c = a * b
c
c = a / b     # 나누기
c
c = a %/% b   # 정수몫
c
c = a %% b    # 나머지
c
c = 3 ** 2    # ** 또는 ^ : 누승
c
c = 5^3
c
# 초과하지 않는 최대 정수
c = 10%/%3
c
c = -10%/%3
c
# ---------------------------------------------
# 관계 연산자
3 >  2
3 >= 2
3 <  2
3 <= 2
3 == 2
3 != 2

# ---------------------------------------------
# 논리 연산자
!FALSE
TRUE && TRUE
TRUE && FALSE
FALSE && TRUE
FALSE && FALSE

TRUE||TRUE
TRUE || FALSE
FALSE || TRUE
FALSE || FALSE
# TRUE 대신 T, FALSE 대신 F 사용 가능
T
F
# ---------------------------------------
v1 = c(0,1,0,1,0,1)
v2 = c(0,1,2,3,4,5)
v1
v2
v1 && v2
v1 & v2
v1 || v2
v1 | v2

# 그리고 알아두면 좋은 몇 개의 유용한 함수를 알아보겠습니다. 
# sum(ｘ) : x가 숫자이면 합을 구하지만 논리식이면 TRUE의 개수를 구해줍니다. 
v2
sum(v2)     # 전체 합
sum(v2<3)   # 조건에 만족하는 합
v1
sum(!v1) 
# mean(x) : x조건에 참인 개수가 몇 퍼센트인지를 구해줍니다. 
v2
mean(v2)
mean(v1)
mean(v1>0)
mean(v2<5)
# any(x) : x조건에서 1개라도 참이 있으면 참을 구해줍니다. 
any(v1)
v3 = c(0,0,0)
v3
any(v3)
# all(x) : ｘ조건에서 전체가 참일 때만 참을 구해줍니다. 
all(v1)
all(v2)
all(v3)
v4 = c(1,2,3,4,5)
v4
all(v4)
# xor(x,y) : 두개의 값이 서로 다를 때만 참을 구해 줍니다
xor(T, T)
xor(T, F)
xor(F, T)
xor(F, F)
#-------------------------------






