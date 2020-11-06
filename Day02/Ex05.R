
a=10
a
.b = 3.14
.b
# Error : 
# ‘.’ 으로 시작한다면 ‘.’ 뒤에는 숫자가 올 수 없다. 
# .13 = 12


str(a)
str(.b)
c = a + .b
c
str(c)

# 만약 데이터에 값이 존재하지 않는다면 NA로 표시할 수 있다.

a1 = 123
a1
a2 = 345
a2
a3 = NA  # 값이 존재하지 않는다
a3

a4 = a1 + a3  # 123 + NA
a4 # NA


is.numeric(a1)
is.character(a2)
is.integer(a1)
is.character(a2)

is.integer(a1)    # FALSE
is.integer(3.14)  # FALSE


is.na(a1)  # FALSE
is.na(a4)  # TRUE
is.na(a5)  # 에러: 객체 'a5'를 찾을 수 없습니다
is.na('')  # FALSE

# NULL은 NULL객체를 뜻하는데, 변수가 초기화 되지 않은 경우 등에 사용할 수 있다. 이는
# 결측치(NA)와 구분하여 생각해야한다. 어떤 변수에 NULL이 할당되었는지는 is.null()을 사용
# 하여 판단할 수 있다.
n1 = NA
n2 = NULL
n1
n2
n1 == n2
is.null(n1)
is.null(n2)

is.na(n1)
is.na(n2)

a = 'Hello'
b = "Hello"

a
b

a = a  + 'World' # Error in a + "World" : 이항연산자에 수치가 아닌 인수입니다

a = paste(a, ' ', 'World')
a

TRUE 
FALSE
T
F

2 == 4
2 == 2

1 >  2
1 >= 2
1 <  2
1 <= 2
1 ==  2
1 != 2

T || T
T || F
F || T
F || F

T | T
T | F
F | T
F | F

T && T    # TRUE
T && F    # FALSE
F && T    # FALSE
F && F    # FALSE

T & T    # TRUE
T & F    # FALSE
F & T    # FALSE
F & F    # FALSE

c(TRUE, TRUE, FALSE, FALSE) && c(TRUE, FALSE, TRUE, FALSE)     # FALSE
c(TRUE, TRUE, FALSE, FALSE) & c(TRUE, FALSE, TRUE, FALSE)  #  TRUE FALSE FALSE FALSE

c(TRUE, TRUE, FALSE, FALSE) || c(TRUE, FALSE, TRUE, FALSE)     # TRUE
c(TRUE, TRUE, FALSE, FALSE) | c(TRUE, FALSE, TRUE, FALSE)  #  TRUE  TRUE  TRUE FALSE

# 요인(Factor)
# 요인(Factor)은 범주형(Categorical) 변수를 위한 데이터 타입이다. 
# 예를들어, 성별은 다음과 같이 지정할 수 있다.

sex = factor(" m" , c(" m" , " f" ))
sex
nlevels(sex)
levels(sex)
levels(sex)[0]
levels(sex)[1]
levels(sex)[2]

levels(sex) <- c(' male ' , ' female ' )
nlevels(sex)
levels(sex)
levels(sex)[0]
levels(sex)[1]
levels(sex)[2]

# 순서형(Ordinal) 변수로 만들기 위해 ordered()를 사용하거나 
# factor() 호출시 ordered=TRUE2) 를 지정해준다.
o1 = ordered(c(" a" , " b" , " c" ))
o1
o2 = factor(c(" a" , " b" , " c" ))
o2
o3 = factor(c(" a" , " b" , " c" ), ordered = TRUE)
o3


# 벡터의 정의
# 벡터는 다른 프로그래밍 언어에서 흔히 보는 배열의 개념으로, 다음과 같이 c() 안에 원하는
# 인자들을 나열하여 정의한다.
v = c(1,2,3,4)
v
for(i in v){
  print(i)
}
sum(v)
mean(v)
# 나열하는 인자들은 한가지 유형의 스칼라 타입이어야한다
# 다른 타입의 데이터를 섞어서 벡터에 저장하면 이들 데이터는 한가지 타입으로 자동 형변환 된다.
v1 = c("1", 2, 3, 4, "5", 6, 7)
v1
str(v)
summary(v)
str(v1)
summary(v1)

# 벡터는 중첩될 수 없다. 따라서 벡터 안에 벡터를 정의하면 이는 단일 차원의 벡터로 변경
# 된다. 중첩된 구조가 필요하다면 뒤에서 다룰 리스트(List) (페이지 46)를 사용해야한다.
v2 = c(1,2,3,c(1,2,3), c(1,2))
v2

# 숫자형 데이터의 경우 start:end 형태로 시작값부터 끝값까지의 값을 갖는 벡터를 만들 수
# 있다. 또는 seq(from, to, by) 형태역시 가능하다.

v3 = c(1:10)
v3 
v4 = seq(1,20,2)
v4
v5 = seq(10,1,-1)
v5
v6 = rep(1, 10)
v6
v7 = rep(c(1,2), 10)
v7
v8 = rep(c(1,2), c(3,6))
v8

# seq_along()은 인자로 주어진 데이터의 길이만큼 1, 2, 3, ..., N 으로 
# 구성된 벡터를 반환한다.
# seq len()은 N값이 인자로 주어지면 1, 2, ..., N으로 구성된 벡터를 반환한다.

v9 = seq_along(c(1,1,1,1,1,1,1))
v9
v10 = seq_len(50)
v10

# 벡터의 각 셀에는 이름을 부여할 수 있다. names()에 원하는 이름을 벡터로 넘겨주면 된다.
x = c(1, 3, 4)
names(x) = c(" kim" , " seo" , " park" )
x


