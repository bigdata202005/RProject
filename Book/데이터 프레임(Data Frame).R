# 데이터프레임(DataFrame)
# 데이터프레임(DataFrame)은 R에서 가장 많이 쓰이는 데이터 구조라 정말 중요합니다!
# 다른 데이터구조와는 달리 데이터 유형에 국한받지 않고 2차원 형태의 데이터 구조

# ---------------------------------------------------------------------
# 1. 데이터프레임(DataFrame) 생성
# ---------------------------------------------------------------------
#    데이터프레임을 만들 땐, data.frame( ) 함수를 사용
#    각 열의 데이터 타입이 같다면 여러가지 데이터 타입을 혼용해서 사용할 수 있다
num = 1:10
num
log = rep(c(T,F), 5)
log
chr = letters[1:10]
chr
df1 = data.frame(num, log, chr)
df1

df2 = data.frame(1:5, c(T,F),c("a","b","c","d","e"))
# 행의 개수가 맞지 않으면 다음과 같은 에러 발생
# Error in data.frame(1:5, c(T, F), c("a", "b", "c", "d", "e")) : 
#   arguments imply differing number of rows: 5, 2

df2 = data.frame(1:5, c(T,F,T,T,F),c("a","b","c","d","e"))
# 열의 이름을 지정하지 않으면 열이름이 자동으로 부여된다.
# X1.5 c.T..F..T..T..F. c..a....b....c....d....e..
df2

# 열의 이름 확인
names(df2)
# 열의 이름 변경
names(df2) <- c("num",'log','alphabet')
names(df2)

# 열의 이름 지정
df3 = data.frame(num=1:5, log=c(T,F,T,T,F),alphabet=c("a","b","c","d","e"))
df3
str(df3)
names(df3)

# ---------------------------------------------------------------------
# 2. 데이터프레임(DataFrame) 열추가
# ---------------------------------------------------------------------
# 1) dataframe$variable 를 통해 변수를 추가하는 방법이 있습니다.
df4 = data.frame(x=1:5, y=LETTERS[1:5])
df4
df4$z = c(T,F,T,T,F)
df4
# 2) 인덱스로 추가가능
df4[4] = letters[1:5]
df4
# 열이름 V4로 지정됨
# 열이름변경
names(df4)
names(df4)[4] = "a"
names(df4)
# 3) transform(dataframe, variable = ' ') 함수
transform(df4, b=5:9)
df4
df4 = transform(df4, b=5:9)
df4
# transform( )함수가 첫번째 방법보다 깔끔하고 
# 여러개의 변수도 한번에 생성할 수 있다는 점에서 이를 선호합니다.
df4 = transform(df4, age=sample(20:30, 5, replace = T), gender=rep(T, 5))
df4
# 기존의 열값을 이용한 추가
df4[8] = df4[,5]%%2!=0
df4
names(df4)[8] = "odd"
df4
df4 = transform(df4, even=df4[,5]%%2==0)
df4
# 행열 확인하기
dim(df4)
nrow(df4)
ncol(df4)

# ---------------------------------------------------------------------
# 3. 데이터프레임(DataFrame) 열수정
# ---------------------------------------------------------------------
# 같은 열이름으로 값을지정하면 수정
df4["even"]
df4["even"] = !df4["even"]
df4["even"]

df4
df4[5] = df4[5] * 2
df4

# ---------------------------------------------------------------------
# 4. 데이터프레임(DataFrame) 행열삭제
# ---------------------------------------------------------------------
# 행을 삭제하고 조회해서 다시저장
df4
df4[2,]
df4[-2,]
df4 = df4[-2,]
df4
# 열을 삭제하고 조회해서 다시저장
df4[,-c(1, 3:5)]
df4 = df4[,-c(1, 3:5)]
df4

# 행 이름 확인 및 변경
rownames(df4)
rownames(df4) <- c(1:4)
rownames(df4)
df4

# 행열 확인하기
length(df4)
dim(df4)
nrow(df4)
ncol(df4)


# ---------------------------------------------------------------------
# 5. 데이터프레임(DataFrame) 행열추가 - 함수이용
# cbind(), rbind(), merge()
# ---------------------------------------------------------------------
mon1 = format(ISOdate(2000, 1:12, 1), "%B")
mon2 = month.abb
mon3 = month.name
mon1
mon2
mon3

df5 = data.frame(month1 = month.name[1:6], 
                 month2 = mon1[1:6],
                 sales=sample(100:200, 6) )
df5
rownames(df5)
rownames(df5) = month.abb[1:6]
rownames(df5)
df5

df6 = data.frame(month1 = month.name[7:12],
                 month2 = mon1[7:12],
                 sales=sample(100:200, 6)
                 )
df6
rownames(df6)
rownames(df6) = month.abb[7:12]
rownames(df6)
df6

# 행추가하기 : rbind(data.frame, data.frame)
# df5 + df6 = df7
df7 = rbind(df5, df6)
df7

# 열 추가하기 : cbind(data.frame, data.frame)
# df5 + df6 = df8
df8 = cbind(df5, df6)
df8

# 변수확인
ls()
# 변수삭제
rm(df8, mon3)
ls()
# 모든변수삭제
rm(list=ls())
ls()

df9 = data.frame(label=letters[1:5], sales=sample(100:200,5))
df9
df10 = data.frame(label=letters[3:7], sales=sample(100:200,5))
df10

cbind(df9, df10) # 문제가많다

# 동일 key 값 기준 결합 : merge(A, B, by='key')
df9
df10
# 같은 키값만 나타남
df11 = merge(df9, df10, by ='label' )
df11

# 모든 키값 나타남
df12 = merge(df9, df10, by ='label', all = TRUE )
df12

# 앞의값기준 키값 나타남
df13 = merge(df9, df10, by ='label', all.x = T )
df13

# 뒤의값기준 키값 나타남
df14 = merge(df9, df10, by ='label', all.y = T )
df14

# ---------------------------------------------------------------------
# 6. 데이터프레임(DataFrame) 데이터접근하기
# ---------------------------------------------------------------------
df14
# 행이름
rownames(df14)
rownames(df14) = month.abb[1:5]
rownames(df14)
# 열이름
names(df14)
names(df14)[2] = "mouse"
names(df14)[3] = "keyboard"
names(df14)
# 전체조회
df14 
# 행조회
df14[1, ]
df14[1:3, ]
df14[-3, ]
df14['Jan', ]
df14[c('Jan','Apr'), ]
# 열조회
df14[1]
df14[,1]
df14[,-1]
df14[2:3]
df14[,2:3]
df14['mouse']
df14[,'mouse']
df14[,c("label",'mouse')]
# 행열조회
df14 
df14[1,1]
df14[1,-1]
df14[1:2,1:2]
df14[-c(1:2),1:2]
df14['Feb','mouse']
df14['Feb','mouse']
df14[c('Feb','May'),c('mouse','label')]
# Error in -c("Feb", "May") : 단항연산자에 유효한 인자가 아닙니다
df14[-c('Feb','May'),c('mouse','label')]

# 컬럼만 선택했을때는 data.frame의 일반적인 모양인 표 형태가 아닌 벡터처럼 
# 결과가 나온 것을 볼 수 있다. 
# 이는 컬럼의 차원이 1이되면 자동으로 데이터 프레임이 아닌 벡터로 값을 반환하기 
# 때문이다. 이를 피하려면 다음과 같이 drop=FALSE 옵션을 지정한다.
df14[,'mouse']
df14[,'mouse', drop=FALSE]
df14[,1]
df14[,1, drop=FALSE]

df15 = data.frame(x=1:1000)
# 간략한정보
str(df15)
# 대량의 데이터일 경우 상단의 6개
head(df15)
# 개수지정
head(df15, 10)
# 대량의 데이터일 경우 하단의 6개
tail(df15)
# 개수지정
tail(df15,3)

# 조건에맞는행만 조회
df14[df14$keyboard>=120,]
nrow(df14[df14$keyboard>=120,])
df14[which(df14$keyboard>=120),]
length(df14[which(df14$keyboard>=120),])

df16 = data.frame(x=letters[1:20], y=sample(1:100,20,replace = T))
df16
df16[df16$y>50,]

df17 = subset(df16, y>50)
df17

df18 = subset(df16, y>50 & y <80)
df18

# 열이름확인
names(df16)
colnames(df16)
colnames(df16) = c('label','score')
colnames(df16)
# 행이름확인
rownames(df16)
rownames(df16) = paste0(rep('row',20),1:20)
rownames(df16)

# 이름을 이용한 조회
df16
df16[, names(df16) %in% c('score')]
df16[, names(df16) %in% c('score'), drop=F]
df16[rownames(df16) %in% paste0(rep('row',10),5:14),]
df16[rownames(df16) %in% paste0(rep('row',10),5:14),names(df16) %in% c('score'), drop=F]

