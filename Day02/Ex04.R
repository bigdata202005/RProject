IMDB = read.csv('IMDB-Movie-Data.csv')
head(IMDB$title)
head(IMDB$title,10)

# 결측치에 대한 정의
# 결측치(Missing Value)는 말 그대로 데이터에 값이 없는 것을 뜻합니다. 줄여서 ’NA’라고 표현

IMDB$Metascore  # NULL

# 결측치 확인
# Metascore 변수 내에서 결측치 논리문 판단 (TRUE, FALSE)
is.na(IMDB$Metascore)[1:10]

# Metascore 변수 내에 결측치 갯수
sum(is.na(IMDB$Metascore))

# IMDB 내 모든 변수별 결측치 갯수
colSums(is.na(IMDB))

# 결측치 제거
# 전부 삭제하는 경우, 가장 극단적인 방법입니다.(결측치가 하나라도 포함된 obs(행)은 삭제)
IMDB2 = na.omit(IMDB) 
colSums(is.na(IMDB2))

# 특정 변수에 결측치가 존재하는 행만 삭제하는 경우
# 12번째 열에 결측치가 있는 경우에만 삭제
IMDB3 = IMDB[complete.cases(IMDB[ ,12]),]
colSums(is.na(IMDB3))
IMDB4 = IMDB[complete.cases(IMDB[ ,11]),]
colSums(is.na(IMDB4))


# 결측치를 특정값으로 대체할 경우
# is.na가 True인 값(결측치)들에 대해 58.99 지정
# Rawdata를 새로운 변수에 복사 
IMDB$Metascore
IMDB$Metascore2 = IMDB$Metascore 
IMDB$Metascore2
# 결측치 대체
IMDB$Metascore2[is.na(IMDB$Metascore2)]=58.99  
IMDB$Metascore2 


# 결측치 생략하고 계산할 경우
IMDB$Revenue..Millions
mean(IMDB$Revenue..Millions) # NA 생성 
mean(IMDB$Revenue..Millions, na.rm = TRUE) # NA 생략하고 계산
