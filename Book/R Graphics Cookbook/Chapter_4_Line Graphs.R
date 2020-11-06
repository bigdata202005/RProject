# 선 그래프는 일반적으로 y 축에서 하나의 연속 형 변수가 x 축에서 다른 연속 형 변수와 관련하여 
# 어떻게 변하는 지 시각화하는 데 사용됩니다. 
# 종종x 변수는 시간을 나타내지 만 다른 연속적인 양(예 : 실험 대상에게 투여 된 약물의 양)을 
# 나타낼 수도 있습니다

# 4.1 Making a Basic Line Graph
# geom_line()사용
# BOD데이터 프레임은 6개의 행과 수질의 평가시간에 대한 생화학적 산소요구량을 주는 2열을 갖는다.
# Time : 측정 시간 (일)을 제공하는 숫자 형 벡터입니다.
# demand : 생화학 적 산소 요구량 (mg / l)을 제공하는 숫자 형 벡터입니다.
BOD
ggplot(BOD, aes(x = Time, y = demand)) + geom_line()

# Time : 6제외
BOD1 <- BOD  
BOD1$Time <- factor(BOD1$Time)
ggplot(BOD1, aes(x = Time, y = demand, group = 1)) +  geom_line()

# y축의 상하한 지정
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +  ylim(0, max(BOD$demand))

# y축의 하한 지정
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +  expand_limits(y = 0)


# 4.2 선 그래프에 포인트 추가
# geom_point()추가
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() + geom_point()

worldpop
str(worldpop)

ggplot(worldpop, aes(x = Year, y = Population)) +
  geom_line() + geom_point()

ggplot(worldpop, aes(x = Year, y = Population)) +
  geom_line() +   geom_point() +   scale_y_log10()

library(ggplot2)
library(gcookbook)

# 4.3 여러 줄로 된 선 그래프 만들기
tg
# colour로 그룹 지정
ggplot(tg, aes(x = dose, y = length, colour = supp)) +  geom_line()

# linetype으로 그룹 지정
ggplot(tg, aes(x = dose, y = length, linetype = supp)) +  geom_line()

# x축의 값을 연속 척도의 값이 아닌 범주로 처리 할 수 있습니다
ggplot(tg, aes(x = factor(dose), y = length, colour = supp, group = supp)) +  geom_line()

# group = supp이 없으면 ggplot은 데이터를 그룹화하여 선을 그리는 방법을 알 수 없어 오류가 발생합니다.
# geom_path: Each group consists of only one observation. Do you need to adjust the group aesthetic?
ggplot(tg, aes(x = factor(dose), y = length, colour = supp)) + geom_line()


# 잘못된 그룹화를 사용할 때 또 다른 일반적인 문제는 톱니 모양의 톱니 패턴이 표시된다는 것입니다 .
# 이것은 각 y 위치에 여러 데이터 포인트가 있고 ggplot은 모두 하나의 그룹에 있다고 생각 하기 때문에 
# 발생합니다 .
ggplot(tg, aes(x = dose, y = length)) +  geom_line()

# geom_point()와 결합하여 포인트를 표시
# shape = supp
ggplot(tg, aes(x = dose, y = length, shape = supp)) + geom_line() + geom_point(size = 4)  
# fill = supp
ggplot(tg, aes(x = dose, y = length, fill = supp)) +  geom_line() + geom_point(size = 4, shape = 21)

# position = position_dodge(0.2) : 겹치는 부분을 조정함
ggplot(tg, aes(x = dose, y = length, shape = supp)) + geom_line(position = position_dodge(0.2)) +            geom_point(position = position_dodge(0.2), size = 4) 


# 4.4 선 모양 변경
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line(linetype = "dashed", size = 1, colour = "blue")
# linetype : "blank" "solid" "dashed" "dotted" "dotdash" "longdash" "twodash"

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line(linetype = "dotdash", size = 1, colour = "blue")


# scale_colour_brewer, scale_colour_manual()을 이용하여 다양하게 지정가능
ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line() +  scale_colour_brewer(palette = "Set1")

ggplot(tg, aes(x = dose, y = length, group = supp)) +
  geom_line(colour = "darkgreen", size = 1.5)

ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line(linetype = "dashed") +
  geom_point(shape = 22, size = 3, fill = "white")


# 4.5 포인트 모양 변경

# 점의 기본 모양은 단색 원이고 기본 크기는 2이며 기본 색상은 검은 색입니다.
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +  geom_point()

# size = 4, shape = 22, colour = "darkred", fill = "pink"
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() + geom_point(size = 4, shape = 22, colour = "darkred", fill = "pink")

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() + geom_point(size = 4, shape = 21, fill = "white")

# scale_colour_brewer, scale_colour_manual()을 이용하여 다양하게 지정가능
# position = position_dodge(0.2) : 겹치는 부분을 조정함
ggplot(tg, aes(x = dose, y = length, fill = supp)) +
  geom_line(position = position_dodge(0.2)) +
  geom_point(shape = 21, size = 3, position = position_dodge(0.2)) +
  scale_fill_manual(values = c("black","white"))


# 4.6 음영 영역이있는 그래프 만들기
#     geom_area()

# sunspot.year : 1700 년부터 1988 년까지의 연간 흑점 수 (한 자리로 반올림).
sunspot.year
time(sunspot.year)

sunspotyear <- data.frame(
  Year     = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)
sunspotyear
head(sunspotyear)

# 기본적으로 영역은 매우 어두운 회색으로 채워지고 윤곽선이 없습니다.
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) + geom_area()

# 색상지정 : colour = "black", fill = "blue", alpha = .2
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) +
       geom_area(colour = "black", fill = "blue", alpha = .2)

# geom_line()과 섞어서 사용도 가능
ggplot(sunspotyear, aes(x = Year, y = Sunspots)) +
  geom_area(fill = "blue", alpha = .2) +
  geom_line()

# 4.7 누적 영역 그래프 만들기
# fill = AgeGroup 사용
# uspopage :	미국 인구의 연령 분포, 1900-2002
uspopage
str(uspopage)
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +  geom_area()

# scale_fill_brewer(palette = "Blues")
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues")

# 범례 윤곽선 없이 그림
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup, order = dplyr::desc(AgeGroup))) +
  geom_area(colour = NA, alpha = .4) +
  scale_fill_brewer(palette = "Blues") +
  geom_line(position = "stack", size = .2)


# 4.8 비례 누적 영역 그래프 만들기
# geom_area(position = "fill") 사용
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(position = "fill", colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues")

# 0~100%로 y축을 나타냄 : scale_y_continuous(labels = scales::percent)
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(position = "fill", colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues") +
  scale_y_continuous(labels = scales::percent)


# 4.9 신뢰 영역 추가
# geom_ribbon, ymin, ymax.
# climate : 1800 년부터 2011 년까지의 지구 기후 온도 이상 데이터
library(dplyr)

climate
str(climate)
# 출처 : 데이터 출처 (Berkeley, CRUTEM3, NASA).
# 연도 : 예상 연도입니다.
# Anomaly1y : 섭씨 온도 이상, 1 년 동안 평활화 됨.
# Anomaly5y : 5 년에 걸쳐 평활화 된 섭씨 온도 이상.
# Anomaly10y : 섭씨 온도 이상, 10 년 동안 평활화 됨.
# Unc10y : 10 년 완화 된 이상에 대한 불확실성.

library(dplyr)
# Grab a subset of the climate data
climate_mod <- climate %>%
  filter(Source == "Berkeley") %>%
  select(Year, Anomaly10y, Unc10y)

climate_mod
# geom_ribbon사용
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_ribbon(aes(ymin = Anomaly10y - Unc10y, ymax = Anomaly10y + Unc10y), alpha = 0.2) +
  geom_line()

# geom_line() 세개를 이용하여 표시
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_line(aes(y = Anomaly10y - Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line(aes(y = Anomaly10y + Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line()



