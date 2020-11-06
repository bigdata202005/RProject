# 변수에 대한 요약 값 살펴보기
HR = read.csv('HR_comma_sep.csv')


# 변수가 Factor 형태일 때는 각 level(Low, Mid, High)에 해당하는 집계 
# Count를 나타내주며, Numeric 형태일 때는 최솟값, 최댓값, 평균 및 각 분위수를 나타내줍니다.
str(HR$salary)
summary(HR$salary)

str(HR$satisfaction_level)
summary(HR$satisfaction_level)

f = as.factor(HR$salary)
str(f)
summary(f)

# 분위수 계산
# 분위수(quantile)이란 변수를 오름차순으로 정리하였을 때, 
# 특정 % 위치에 해당되는 값을 의미합니다. 
# 예를 들어, 
# Q1은 1분위수로 하위 25%에 해당되는 직원의 satisfaction_level값을 나타내줍니다. 
# Median(중위수)는 중간(50%)에 해당되는 직원의 satisfaction_level을 나타내주며, 
# Q3( 하위 75%, 상위 25%)의 기준에 해당되는 직원의 satisfaction_level을 의미합니다.

# 10%, 30%, 60%, 90%에 해당하는 분위수 뽑아내기
quantile(HR$satisfaction_level,probs = c(0.1,0.3,0.6,0.9)) 

# 합, 평균, 표준편차 구하기
# 합
sum(HR$satisfaction_level)

# 평균
mean(HR$satisfaction_level)

# 단일 변수의 표준편차 구하기
sd(HR$satisfaction_level)

# 다중 변수의 합, 평균 구하기
# obs(행)별로 합,평균 구할 시에는 rowSums, rowMeans 활용
# 컬
colMeans(HR[1:3])
# 컬
colSums(HR[1:3])

# 빈도 테이블 작성하기
# 1차원 빈도 테이블
TABLE = as.data.frame(table(HR$sales))
TABLE
dim(TABLE)

# 2차원 테이블
TABLE2 = as.data.frame(xtabs(~ HR$salary + HR$sales))
TABLE2


# 5. 연습문제
# HR 데이터에서 last_evaluation의 평균을 구하시오.
mean(HR$last_evaluation)
# HR 데이터에서 last_evaluation의 표준편차를 구하시오.
sd(HR$last_evaluation)
# HR 데이터에서 sales에 대한 빈도표를 작성하시오.
SALES_TABLE = as.data.frame(table(HR$sales))
SALES_TABLE
# HR 데이터에서 left, salary에 대한 교차표를 작성하시오.
LEFT_TABLE = as.data.frame(xtabs(~ HR$left + HR$salary))
LEFT_TABLE


