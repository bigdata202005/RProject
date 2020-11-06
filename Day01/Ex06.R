HR = read.csv('HR_comma_sep.csv') # /로 경로 구분
# 데이터 윗부분 띄우기
head(HR,n = 3)
# 데이터 strings 파악
str(HR)
# 요약된 데이터 살펴보기
summary(HR) # 요약된 데이터 살펴보기
summary(HR$left)
