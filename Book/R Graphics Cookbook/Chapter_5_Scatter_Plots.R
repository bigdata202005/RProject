# Chapter 5 Scatter Plots : 산점도 그래프

# 산점도는 두 연속 변수 간의 관계를 표시하는 데 사용됩니다. 
# 산점도에서 데이터 세트의 각 관측치는 점으로 표시됩니다. 
# 종종 산점도에는 일부 통계 모델을 기반으로 예측 된 값을 보여주는 선이 있습니다. 
# 이 라인을 추가하는 것은 R 및 ggplot2 패키지로 쉽게 할 수 있으며, 포인트를 보는 것만으로 
# 추세가 즉시 명확하지 않은 경우 데이터를 이해하는 데 도움이 될 수 있습니다.
# 
# 큰 데이터 세트의 경우 데이터 세트의 모든 단일 관측치를 플로팅하면 
# 점이 겹치고 서로 가려 질 때 오버 플로팅이 발생할 수 있습니다. 
# 오버 플로팅 문제를 해결하려면 데이터를 표시하기 전에 요약해야 할 것입니다.

# 5.1 기본 산점도 만들기
# geom_point()와 x,y 를 사용합니다.
library(gcookbook)
library(dplyr)
# heightweight : 학생의 키와 몸무게
heightweight
str(heightweight)

ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point()
# 모양지정
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point(shape = 21)
# 크기지정
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point(size = 1.5)
# 모양 크기 지정
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point(shape = 21, size = 1.5)


# 5.2 모양 또는 색상을 사용하여 포인트 그룹화
heightweight %>%  select(sex, ageYear, heightIn)
# 성별 별로 그룹화하여 표시하기
# shape = sex, colour = sex 사용함
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex, colour = sex)) +  geom_point()

# scale_shape_manual(values = c(1,2)) + scale_colour_brewer(palette = "Set1") 사용함
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex, colour = sex)) +
  geom_point() +
  scale_shape_manual(values = c(1,2)) +
  scale_colour_brewer(palette = "Set1")

# 참고하기
# 색상 확인하기
colors()
# palette 확인하기
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

# 5.3 다른 점 모양 사용
# 점 모양은 첨부된 이미지 참조
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 3)

# 그룹화하여 다른 모양으로 출력하기
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex)) +
  geom_point(size = 3) + scale_shape_manual(values = c(1, 4))

# weightgroup 열추가
hw <- heightweight %>% mutate(weightgroup = ifelse(weightLb < 100, "< 100", ">= 100"))
hw

# 하나의 변수는 점의 모양으로 표시되고 다른 변수는 점의 채우기 (비어 있거나 채워짐)로 표시 될 수 있습니다. # scale_shape_manual()
# scale_fill_manual() 
ggplot(hw, aes(x = ageYear, y = heightIn, shape = sex, fill = weightgroup)) +
  geom_point(size = 2.5) +
  scale_shape_manual(values = c(21, 24)) +
  scale_fill_manual(
    values = c(NA, "black"),
    guide = guide_legend(override.aes = list(shape = 21))
  )

# 5.4 연속 변수를 색상 또는 크기에 매핑
# 색상 또는 크기를 사용하여 세 번째 연속 변수를 나타내려고합니다.
heightweight %>%  select(sex, ageYear, heightIn, weightLb)
# ageYear, heightIn, weightLb을 colour, size를 이용하여 지정함 :크기와 색상 변화
ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = weightLb)) +  geom_point()
ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +  geom_point()

range(heightweight$weightLb)
size_range <- range(heightweight$weightLb) / max(heightweight$weightLb) *  6
size_range

ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point() +
  scale_size_continuous(range = size_range)

ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point() +
  scale_size_area()

ggplot(heightweight, aes(x = ageYear, y = heightIn,  colour = weightLb)) +
  geom_point(alpha = .5, size=8) 

ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point(alpha = .5, size=8) +
  scale_size_continuous(range = size_range)

ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb, colour = sex)) +
  geom_point(alpha = .5, size=8) +
  scale_size_area()


# 5.5 오버 플로팅 처리 : 겹치는 부분 처리하기
# 높은 수준의 오버 플로팅이있는 경우 가능한 해결 방법이 많이 있습니다.
# 1) 점을 반투명하게 만들기
# 2) 데이터를 직사각형으로 비닝 (정량 분석에 더 적합)
# 3) 데이터를 육각형으로 묶기
# 4) 상자 그림 사용

diamonds
str(diamonds)

# 약 54,000 개의 포인트가있는 오버 플로팅
diamonds_sp <- ggplot(diamonds, aes(x = carat, y = price))
diamonds_sp +  geom_point()

# 1) 투명도를 이용한 방법
diamonds_sp + geom_point(alpha = .1, size=3.5)
diamonds_sp + geom_point(alpha = .01, size=3.5)


# 2) 직사각형으로 압축(binning)하고 점 밀도를 직사각형의 채우기 색상에 매핑
# 기본적 stat_bin_2d()으로는 공간을 x 및 y 방향 의 30 개 그룹으로 나눠 총 900개의 빈을 만듭니다.
diamonds_sp +  stat_bin2d()
# bins = 50개  빈을 만듭니다.
diamonds_sp + stat_bin2d(bins = 50) + scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000))

# bins = 100개  빈을 만듭니다.
diamonds_sp + stat_bin2d(bins = 100) + scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000))

# 3) 다른 대안은 데이터를 직사각형 대신 육각형으로 압축(binning)
diamonds_sp +  stat_binhex() +  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 8000))
diamonds_sp +  stat_binhex() +  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000),
    breaks = c(0, 250, 500, 1000, 2000, 4000, 6000))


# 데이터가 하나 또는 두 축에서 불연속적인 경우에도 오버 플로팅이 발생할 수 있습니다 . 
# 이 경우를 사용 하여 점을 무작위로 지터링 할 수 있습니다. 
# 기본적으로 지터의 양은 각 방향의 데이터 해상도의 40 %이지만 
# 이러한 양은 position = position_jitter(width = .5, height = 0) 으로 제어 할 수 있습니다.

# ChickWeight데이터 프레임은 병아리의 초기 성장의 다이어트 효과 실험에서 578 행 4 열을 갖는다.
cw_sp <- ggplot(ChickWeight, aes(x = Time, y = weight))
cw_sp +  geom_point()
cw_sp +  geom_point(position = "jitter")  
cw_sp +  geom_point(position = position_jitter(width = .5, height = 0))


# 4) geom_boxplot 사용하기
#  박스 플롯으로 그룹화 
cw_sp + geom_boxplot(aes(group = Time))
# 그룹을 지정하지 않으면
cw_sp + geom_boxplot()


# 5.6 적합 회귀 모형 선 추가
#평활화란 : 명암 대비를 높이기 위하여, 화소 값들의 분포를 재조정하는 작업
# ggplot2에서는 아래 다섯가지의 regression method를 제공한다.
# linear mode(lm) : 선형 모델
# generalized linear model(glm) : 일반화 선형 모델
# generalized additive model(gam) : 일반화 가법 모델 
# robust linear model(rlm) : 견고한 선형 모델
# loess

# 산점도에 선형 회귀선을 추가하려면 stat_smooth()사용
hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn))
# method = lm은 lm()(선형 모델) 함수로 데이터를 맞추도록 지시
hw_sp + geom_point() +  stat_smooth(method = lm)

# 기본적으로 stat_smooth()회귀 적합도에 대한 95 % 신뢰 영역도 추가합니다. 
# 신뢰 구간은의 값을 수정하여 변경 level하거나 다음을 사용하여 비활성화 할 수 있습니다 se = FALSE

# 99% 신뢰 영역
hw_sp +  geom_point() +  stat_smooth(method = lm, level = 0.99)
# 신뢰 구간 비활성화
hw_sp +  geom_point() +  stat_smooth(method = lm, se = FALSE)


# 적합 선의 기본 색상은 파란색입니다. 
# colour, linetype, size도 설정할 수 있습니다. 
# 선을 강조하려면 점을 변경하여 점을 덜 눈에 띄게 만들 수 있습니다
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(method = lm, se = FALSE, colour = "black")

# formula = y~x
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(formula=y~x)
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(formula=y~x, level = 0.99)
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(formula=y~x, se=F)
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(formula=y~x, se=F, color='black')
hw_sp +  geom_point(colour = "grey60") +  stat_smooth(method = loess)

# 5.7 기존 모델에서 적합 선 추가
model <- lm(heightIn ~ ageYear + I(ageYear^2), heightweight)
model
xmin <- min(heightweight$ageYear)
xmax <- max(heightweight$ageYear)
predicted <- data.frame(ageYear = seq(xmin, xmax, length.out = 100))
xmin
xmax
predicted
# predict() : lm(), glm()과 같은 명령문으로 얻어낸 회귀선으로 주어진 x값에 해당하는 
#             새로운 y값을 predict하는 함수
# model : 예측에 사용할 회귀분석 결과식
# newdata : 예측에 사용할 x값, 값을 지정하지 않을시 1~45 정수값에 대한 예측값을 출력한다.

predicted$heightIn <- predict(model, predicted)
predicted

hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point(colour = "grey40")
hw_sp
hw_sp +  geom_line(data = predicted, size = 1)



