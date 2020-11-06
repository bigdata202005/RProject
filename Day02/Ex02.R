library(ggplot2) # 패키지 부착
library(ggthemes)

HR$salary = factor(HR$salary,levels = c("low","medium","high"))
HR$salary
# 결과는 우측하단의 plots창에 나타난다.
ggplot(HR)   # 그래프 바탕만
ggplot(HR,aes(x = salary))  # 그래프에 x축지정
ggplot(HR,aes(x=salary)) +  geom_bar() # 막대 그래프
ggplot(HR,aes(x=salary)) +  geom_bar(fill = 'royalblue')  # 색상
ggplot(HR,aes(x=salary)) +  geom_bar(aes(fill=salary))  # 막대별 다른 색상


# 색 설정_1
ggplot(HR,aes(x=salary)) +  geom_bar(fill = 'royalblue') # royalblue색으로 색 채우기

# 색 설정_2
ggplot(HR,aes(x=salary)) + geom_bar(aes(fill=left)) # left 값에 따라 색 채우기 


# 히스토그램
# 기본
ggplot(HR,aes(x=satisfaction_level))+ geom_histogram()
# 구간 수정 및 색 입히기
ggplot(HR,aes(x=satisfaction_level))+
  geom_histogram(binwidth = 0.05, col='red',fill='royalblue') 



# 밀도그래프(Density Plot)
# 밀도그래프 : 연속형 변수 하나를 집계 내는 그래프, 1차원
# 밀도그래프는 연속형변수를 일정 범위로 구간을 만들어, 
# x축으로 설정하고 y축은 집계된 값(percentage)을 나타내는 그래프입니다.
# 기본
ggplot(HR,aes(x=satisfaction_level)) + geom_density()

# 색 입히기
# col은 테두리, fill은 채우기박스플롯
ggplot(HR,aes(x=satisfaction_level))+ geom_density(col='red',fill='royalblue')



# 박스플롯(Boxplot)
# 
# 박스플롯 : 이산형 변수에 따라 연속형 변수의 분포 차이를 표현해주는 2차원 그래프
# 박스플롯은 이산형 변수와 연속형 변수를 한번에 표현하기 위한 그래프입니다. 
# 데이터 탐색과정(EDA) 에서 매우 중요하게 쓰이는 플롯 중 하나이니, 
# 꼭 기억해두시길 바랍니다.

# 기본
ggplot(HR,aes(x=left,y=satisfaction_level)) +  geom_boxplot(aes(fill = left))

ggplot(HR,aes(x=left,y=satisfaction_level)) + geom_boxplot(aes(fill = left)) +
  xlab("이직여부")

ggplot(HR,aes(x=left,y=satisfaction_level)) + geom_boxplot(aes(fill = left)) +
  xlab("이직여부") +  ylab("만족도")

ggplot(HR,aes(x=left,y=satisfaction_level)) + geom_boxplot(aes(fill = left)) +
  xlab("이직여부") +  ylab("만족도")  + ggtitle("Boxplot")

ggplot(HR,aes(x=left,y=satisfaction_level)) + geom_boxplot(aes(fill = left)) +
  xlab("이직여부") +  ylab("만족도")  + ggtitle("Boxplot") + labs(fill = "이직 여부")



# 기본에서 조금 더 추가
ggplot(HR,aes(x=left,y=satisfaction_level)) +
  geom_boxplot(aes(fill = left),alpha = I(0.4)) + 
  geom_jitter(aes(col = left),alpha = I(0.4)) + 
  xlab("이직여부") + ylab("만족도") + ggtitle("Boxplot") +
  labs(fill = "이직 여부", col = "이직 여부") 

# 기본에서 조금 더 추가에서 조금 변경
ggplot(HR,aes(x=left,y=satisfaction_level)) +
  geom_boxplot(aes(fill = salary),alpha = I(0.4),outlier.colour = 'red') +
  xlab("이직여부") + ylab("만족도") + ggtitle("Boxplot") +
  labs(fill = "임금 수준") 


# 기본
ggplot(HR,aes(x=average_montly_hours,y=satisfaction_level))+
  geom_point()

# 간단한 색칠로 인사이트 발굴하기
ggplot(HR,aes(x=average_montly_hours,y=satisfaction_level))+
  geom_point(aes(col = left)) + 
  labs(col = '이직 여부') + xlab("평균 근무시간") + ylab("만족도")
