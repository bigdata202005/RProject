# csv파일 읽기
HR = read.csv('HR_comma_sep.csv')

# 데이터 윗부분 띄우기
head(HR,n = 3)
# 데이터 아래부분 띄우기
tail(HR,n = 2)

str(HR)
# 요약된 데이터 살펴보기
summary(HR) # 요약된 데이터 살펴보기

# 데이터 strings 변경
summary(HR$left)

HR$Work_accident=as.factor(HR$Work_accident)
HR$promotion_last_5years=as.factor(HR$promotion_last_5years)

# 데이터 타입을 factor로 변경
HR$left=as.factor(HR$left)
# 요약정보 보기
summary(HR$left)
# 데이터 타입 확인
str(HR$left)
# 데이터 타입을 numeric로 변경
HR$left=as.numeric(HR$left)
summary(HR$left)
str(HR$left)

# 조건에 맞는 값 할당하기 ifelse
# ifelse(조건, TRUE,FALSE)
HR$satisfaction_level_group_1 = ifelse(HR$satisfaction_level > 0.5, 'High', 'Low')
str(HR$satisfaction_level_group_1)
HR$satisfaction_level_group_1 = as.factor(HR$satisfaction_level_group_1)
summary(HR$satisfaction_level_group_1)

# atisfaction_level이 0.8보다 크다면 ‘High’, 0.5 ~ 0.8이면 ‘Mid’, 나머지는 ‘Low’
# 조건이 추가가 되었을 경우에는 ifelse(ifelse()) 형태로 ifelse안에 ifelse문을 쓰면 됩니다.
HR$satisfaction_level_group_2 = 
  ifelse(HR$satisfaction_level > 0.8, 'High', ifelse(HR$satisfaction_level > 0.5, 'Mid', 'Low'))
str(HR$satisfaction_level_group_2)
HR$satisfaction_level_group_2 = as.factor(HR$satisfaction_level_group_2)
summary(HR$satisfaction_level_group_2)

# number_project
HR$odd_even = ifelse(HR$number_project%%2==0, 'even','odd')
str(HR$odd_even)
HR$odd_even = as.factor(HR$odd_even)
summary(HR$odd_even)

# 조건에 맞는 데이터 추출하기 subset
# subset() 함수는 조건에 맞는 데이터를 추출하는 명령어입니다.
# subset(데이터, 추출 조건)
# salary가 high인 직원들만 추출하여 HR_High라는 새로운 데이터 셋을 생성
HR_High = subset(HR,salary == 'high')
HR_High
summary(HR_High)
summary(HR_High$salary)

HR_Even = subset(HR, HR$odd_even=='even')
summary(HR_Even)
summary(HR_Even$salary)

# salary가 high이면서, sales가 IT인 직원들만 추출하여 
# HR_High_IT 생성 (교집합)
HR_High_IT = subset(HR, salary == 'high' && sales=='IT')
summary(HR_High_IT)
summary(HR_High_IT$salary)  # 없다

HR_High_IT = subset(HR, salary == 'high' & sales=='IT')
summary(HR_High_IT)
summary(HR_High_IT$salary)

HR_High_IT = subset(HR,salary == 'high' & sales == 'IT')
print(xtabs(~ HR_High_IT$sales + HR_High_IT$salary))


HR_High_IT = subset(HR,salary == 'high' | sales == 'IT')
print(xtabs(~ HR_High_IT$sales + HR_High_IT$salary))

# 설치된 패키지 확인
search()
# 패키지 설치
install.packages("plyr")
# import
library(plyr)
search()

# ddply를 활용한 집계 데이터 만들기
# 집계 데이터를 만드는 방법은 여러 방법이 있지만, 
# 지금은 가장 기본적인 ddply()라는 함수를 사용해보도록 하겠습니다. 
# 명령어의 사용방법은 다음과 같습니다.
# 분석할 데이터 설정
# 집계 기준 변수 설정
# 집계 값을 저장할 컬럼명 및 계산 함수 설정
# ddply(데이터,집계기준, summarise, 요약 변수)
SS=ddply(HR, # 분석할 Data Set 설정
         c("sales","salary"),summarise, # 집계 기준 변수 설정
         M_SF = mean(satisfaction_level), # 컬럼명 및 계산 함수 설정
         COUNT =length(sales), 
         M_WH = round(mean(average_montly_hours),2))

SS


