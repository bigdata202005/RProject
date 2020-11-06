# 벡터는 R에서 가장 기본되는 자료형이다.
# 보통 R내부에서는 벡터라는 이름이 아니라 데이터 타입으로 부른다.
# 따라서 타입을 검사하면 숫자는 numeric, 문자열은 character로 나온다.
# R에서 일반적인 모든 데이터는 벡터이며 벡터는 다른 언어로 따지면 일종의 배열이라고 할 수 있다.
# 그러나 배열 데이터형도 있으니까 살짝 미묘하다.
# 벡터의 차원은 1차원으로 분류되며 간단한 값조차 벡터이다.
# 그러니 일반적인 모든 값들은 벡터라고 할 수 있다.

v1 = 10
v2 = c(10)
v3 = c(1,2,3,4,5,6,7,8,9)
v1
v2
v3
# str함수에 변수를 지정하면 해당 변수의 속성과 길이, 그리고 미리보기 값을 제공합니다.
str(v1)
str(v2)
str(v3)

# class는 데이터의 속성만 표시합니다.
class(v1)
class(v2)
class(v3)
# 벡터 판단
is.vector(v1)
is.vector(v2)
is.vector(v3)

# 벡터의 길이 확인 - length()
length(v1)
length(v2)
length(v3)

# 벡터의 원소 호출 - 벡터이름[원소 번호]
v3[1]
v3[2]
v3[3]
for(i in 1:length(v3)){
  print(v3[i])
}
# 요소
v3[1:3]
v3[c(1,3,5)]

# -----------------------------------
# c 함수
# -----------------------------------
# c 함수 : R에서 벡터를 정의하는 방법에 대하여 알아보도록 하자.
# c() 명령어가 벡터의 원소를 일일이 적어서 정의하는 방법이라면 
# “:”을 이용한 방법은 일정 규칙이 있는 벡터를 정의할 때 아주 유용한 방법이다.
? c
v4 = c(1,2,3,4,5,6,7,8,9,10)
v4
v5 = c(1:10)
v5
v6 = 1:10
v6
v7 = c(1:3, 7:10)
v7
v8 = c(1,2,3, 10:20, 4, 5, 6)
v8
v9 = 10:-10
v9
v10 = c(5:-5)
v10
# 영문자
? LETTERS
v11 = LETTERS
v11
v12 = LETTERS[1]
v12
v13 = LETTERS[1:10]
v13
v14 = letters
v14
v15 = letters[1]
v15
v16 = letters[1:10]
v16

v17 = c(1:10, letters[1:10])
v17

# 이름이 있는 벡터
v18 = c("a"=1, "b"=2, "c"=3)
v18
names(v18)

v19 = c(1:10)
v19
names(v19)
names(v19) = letters[1:10]
names(v19)
v19
v19['a']
v19[c("a","d","f")]
v19[c(1,4,6)]

# -----------------------------------
# seq 함수
# -----------------------------------
# 벡터를 정의하는 또 한가지 방법은 수열을 뜻하는 sequence의 앞 세글자를 딴 
# seq() 명령어를 이용하는 방법
? seq
v20 = c(1:10)
v20
v21 = seq(10)
v21
v22 = seq(1:10)
v22
v23 = seq(from=1, to=10)
v23
v24 = seq(1,10,2)
v24
v25 = seq(from=10, to=1, by = -1)
v25
# length.out은 리턴되는 벡터의 원하는 길이를 써주면 되고 
# along.with의 경우 along.with의 인수 값으로 전달되는 벡터의 길이만큼 seq를 실행합니다.
v26 = seq(1,10,length.out = 4)
v26
v27 = seq(1, 10, along.with = c(1:3))
v27

# ------------------------------
# seq.int 함수
# ------------------------------
seq()
# seq.int(from, to, by, length.out, along.with, ...)
seq.int(1,10, by = 3)
seq.int(1,10, length.out = 4)
seq.int(1,10, along.with = c(1:4))

# -----------------------------------
# seq_along/seq_len/seq.Date 함수
# -----------------------------------
# seq_along 함수는 무조건 1부터 시작하며 인수로 seq의 along.with 값만 받는 함수라고
# 생각하시면 됩니다. 즉, 인수로 along.with 값으로 들어가 벡터 하나만 받습니다.
# 쉽게 말해서 to값이 1로 고정되어 있는 seq와 같다고  생각하시면 됩니다.
? seq_along
seq_along(1:10)
seq_along(5:9)

# 1부터 시작하는 n개의 벡터
? seq_len
seq_len(1)
seq_len(10)

start = as.Date("2020-01-01")
end = as.Date("2020-01-15")
start
str(start)
end
str(end)

seq.Date(start, end)
# Error in seq.Date(start, end) : 
# 정확하게 두개의 'to', 'by' 그리고 'length.out' / 'along.with'가 반드시 지정되어야 합니다
seq.Date(start, end, length.out = 15)
seq.Date(start, end, along.with = c(1:3))

# ------------------------------
# rep 함수
# ------------------------------
? rep
r1 = rep(1:4, 2)
r1
# times : 앞에 나온 숫자를 몇번 반복 할지 정하는 인자입니다
r2 = rep(x = 1:4, times=2 )
r2
# each : 앞에 나온 숫자를 각각 몇번 반복할지 정하는 인자입니다.
r3 = rep(1:4, each=2)
r3
# 1 1번 2 2번 3 3번 4 4번
r4 = rep(1:4, c(1:4))
r4
# 1, 3 2번 2,4 3번
r5 = rep(1:4, c(2,3,2,3))
r5
r6 = rep(c("a","1"), times = 3)
r6
r7 = rep(letters[1:3], each=4)
r7

rep(1:4, each = 2, len = 4)    # first 4 only.
rep(1:4, each = 2, len = 10)   # 8 integers plus two recycled 1's.
rep(1:4, each = 2, times = 3)  # length 24, 3 complete replications
rep(1:4, length.out=10)
? rep.int
rep.int(1:4, 2)
rep_len(1:4, length.out=10)

# ------------------------------
# 날짜/시간
# ------------------------------
Sys.Date()
Sys.time()
format(Sys.Date(), '%Y-%m-%d')
rep(format(Sys.Date(), '%Y-%m-%d'), 7)

# ------------------------------
# 벡터내 데이터 접근
# ------------------------------
# 벡터는 [ ] 안에 인덱스를 적어서 각 요소를 가져올 수 있다. 
# 이때, 인덱스는 다른 언어와 달리 1 로 시작한다.
vector1 = letters[1:10]
vector1
vector1[1]
vector1[1:3]
vector1[c(1,2,5, 7:10)]

# ‘-인덱스’ 와 같이 음수의 인덱스를 사용해 특정 요소만 제외
vector1[-3]
vector1[-c(3:6)]

# 벡터의 각 셀에 names()를 사용해 이름을 부여해 두었다면,
# 이 이름을 사용해 데이터를 접근
vector2 = 11:20
vector2
names(vector2)
names(vector2) = LETTERS[1:10]
names(vector2)
names(vector2)[2]
names(vector2)[2:5]

vector2[1]
vector2[1:3]
vector2[c(1,2,5, 7:10)]
vector2['A']
vector2[c('A','D')]

# ------------------------------
# 벡터의 길이
# ------------------------------
# 벡터의 길이는 length() 또는 NROW() (대문자임에 주의! ) 를 통해 알 수 있다. 
# nrow()는 행렬(Matrix) (페이지 48)의 행의 수를 알려주는 함수이지만 nrow()의 
# 변형인 NROW()는 인자가 벡터인경우 벡터를 n행 1열의 행렬로 취급해 길이를 반환한다.
length(vector2) # 10
NROW(vector2)   # 10
nrow(vector2)   # NULL


# ---------------------------------------------
# 내장상수
# ---------------------------------------------
# LETTERS: 로마 알파벳의 26 개의 대문자
# letters: 로마 알파벳의 26 개의 소문자
# month.abb: 영어 월 이름에 대한 세 글자 약어.
# month.name: 해당 연도의 영어 이름
# pi: 원주와 지름의 비율.
# ---------------------------------------------
month.abb
month.name
pi
LETTERS
letters
# 현재 로케일에서 개월
format(ISOdate(2000, 1:12, 1), "%B")
format(ISOdate(2000, 1:12, 1), "%b")
format(ISOdate(2000, 4:6, 30), "%B")
format(ISOdate(2000, 5:10, 2), "%b")

# ---------------------------------------------
# 패턴을 가지는 벡터
# sequence 함수
# ---------------------------------------------
? sequence
sequence(c(3, 2))               # 1~3, 1~2 : 1 2 3 1 2
c(1:3, 1:2)                     # 1 2 3 1 2
sequence(c(3, 2), from=2)       # start : 2 # 2 3 4 2 3
c(2:4, 2:3)                     # 2 3 4 2 3
sequence(c(3, 2), from=2, by=2) # 2 4 6 2 4
sequence(c(3, 2), by=c(-1, 1))  # 1  0 -1  1  2

# ---------------------------------------------
# 중복된 값을 제외한 벡터
# unique 함수 : 중복요소 제거된 배열을 반환
# ---------------------------------------------
? unique
rep(1:3, 5)
unique(rep(1:3, 5)) 
rep(1:3, length=10)
unique(rep(1:3, length=10)) 

v <- c(3:5, 11:8, 8 + 0:5)
v
uv1 =unique(v)
uv1
uv2 =unique(v, fromLast = T)
uv2
v2 = sample(100, 100, replace = TRUE)
v2
uv3 = unique(v2)
uv3
length(v2)
length(uv3)

# ---------------------------------------------
# 0을 늘어놓은 벡터
# numeric 함수
# ---------------------------------------------
numeric(10) 
numeric(5) 
rep(0, 10)
