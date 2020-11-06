ls()
rm(list = ls())
ls()
# 스칼라
# R의 기본형은 벡터[5, 6]이므로 이들 스칼라자료는 길이 1의 벡터로 볼 수 있다. 
# 그러나 실제로는 편하게 스칼라 자료라고 생각해도 큰 문제는 없다.

# 숫자 : 정수, 부동 소수 등이 자연스럽게 지원된다.
a = 123
a
b = 12.345
b
#  str함수는 해당 변수의 상세 설명을 보여주는 함수
cat(str(a), str(b))
class(a)
length(a)

# NA : 만약 데이터에 값이 존재하지 않는다면 NA로 표시할 수 있다. 
#      NA는 not available의 줄임말로 공간은 차지하되 값은 없는 상태를 의미
kor = 67
eng = 65
mat = 99
edps = NA
cat(kor, eng, mat, edps)
edps
tot = kor + eng + mat + edps
tot
avg = tot/4
avg
sum(kor, eng, mat, edps)
sum(kor, eng, mat, edps, na.rm = T)
# 어떤 변수에 NA가 저장되어있는지는 is.na() 함수로 확인
is.na(kor)
is.na(edps)

v1 = sample(1:100, 10)
is.vector(v1)
v2 = ifelse(v1 %% 2 == 0, v1 , NA)
v2
length(v2)
sum(v2)
sum(v2, na.rm = T)
mean(v2)
mean(v2, na.rm = T)


# NULL은 NULL객체를 뜻하는데, 변수가 초기화 되지 않은 경우 등에 사용할 수 있다. 이는
# 결측치(NA)와 구분하여 생각해야한다. 어떤 변수에 NULL이 할당되었는지는 is.null()을 사용
# 하여 판단할 수 있다.

v3 = NULL
v3
v4 = NA
v4
v3 == v4
is.na(v3)
is.na(v4)
is.null(v3)
is.null(v4)

# 문자열 : R은 C 등의 언어에서 볼 수 있는 한개 문자에 대한 데이터 타입은 없다. 
# 대신 문자열로 모든것을 처리한다. 
# 문자열은 ‘this is string’ 또는 “this is string” 과 같이 어느 따옴표로 묶어도된다.
str1 = "R 프로그램"
str1

str2 = 'R 프로그램'
str2

str1 == str2
# Error in str1 + str2 : 이항연산자에 수치가 아닌 인수입니다
str1 + str2
str3 = paste(str1, str2, sep = ' ')
str4 = sprintf("%s %s", str1, str2)
str3
str4

# 진리값
# TRUE, T는 모두 참값을 말한다. FALSE, F 는 거짓을 말한다. 
# 진리값에는 & (AND), | (OR), ! (NOT) 연산자를 사용할 수 있다.
! T
! F
T | T
T | F
F | T
F | F

T & T
T & F
F & T
F & F





