# 선그래프그리기
# ggplot() + geom_line()
BOD
ggplot(BOD, aes(x = Time, y = demand)) +  geom_line()

BOD1 <- BOD  # Make a copy of the data
BOD1$Time <- factor(BOD1$Time)

BOD1$Time

ggplot(BOD1, aes(x = Time, y = demand, group = 1)) +  geom_line()
# ylim(0, max(BOD$demand) : y축한계지정
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  ylim(0, max(BOD$demand))
#  expand_limits(y = 0)
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  expand_limits(y = 0)

# 4.2 선 그래프에 포인트 추가
# ggplot() + geom_line() + geom_point()
ggplot(BOD, aes(x = Time, y = demand)) +  geom_line() + geom_point()

head(worldpop)
ggplot(worldpop, aes(x = Year, y = Population)) +
  geom_line() +
  geom_point()

# Same with a log y-axis
ggplot(worldpop, aes(x = Year, y = Population)) +
  geom_line() +
  geom_point() +
  scale_y_log10()

# 4.3 여러 줄로 된 선 그래프 만들기
tg

# colour = supp : 색상으로 여러줄 그리기
ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line()

#  linetype = supp : 선모양으로 여러줄 그리기
ggplot(tg, aes(x = dose, y = length, linetype = supp)) +
  geom_line()

factor(tg$dose)

ggplot(tg, aes(x = factor(dose), y = length, colour = supp, group = supp)) +
  geom_line()

# 그룹을 잘못지정 하면 이상한 그래프가 나옴
ggplot(tg, aes(x = dose, y = length)) + geom_line()
# group = supp
ggplot(tg, aes(x = dose, y = length, group = supp, linetype = supp )) + geom_line()
ggplot(tg, aes(x = dose, y = length, group = supp, colour = supp )) + geom_line()

# shape = supp : 점의모양지정
ggplot(tg, aes(x = dose, y = length, shape = supp)) +
  geom_line() +
  geom_point(size = 4)  

# shape = 21 
ggplot(tg, aes(x = dose, y = length, fill = supp)) +
  geom_line() +
  geom_point(size = 4, shape = 21) 

# 접들이 겹칠떄 처리하기 : position = position_dodge(0.2)
ggplot(tg, aes(x = dose, y = length, shape = supp)) +
  geom_line(position = position_dodge(0.2)) +           # Dodge lines by 0.2
  geom_point(position = position_dodge(0.2), size = 4)

# 4.4 선 모양 변경
# 선종류, 크기, 색상
# linetype = "dashed", size = 1, colour = "blue"
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line(linetype = "dashed", size = 1, colour = "blue")

# scale_colour_brewer(palette = "Set1")
ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line() +
  scale_colour_brewer(palette = "Set1")

ggplot(tg, aes(x = dose, y = length, group = supp)) +
  geom_line(colour = "darkgreen", size = 1.5)

# Since supp is mapped to colour, it will automatically be used for grouping
ggplot(tg, aes(x = dose, y = length, colour = supp)) +
  geom_line(linetype = "dashed") +
  geom_point(shape = 22, size = 3, fill = "white")


# 4.5 포인트 모양 변경
ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  geom_point(size = 4, shape = 21, colour = "darkred", fill = "pink")

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_line() +
  geom_point(size = 4, shape = 22, colour = "darkred", fill = "pink")


pd <- position_dodge(0.2)
# pd : 겹칠떄 간격지정
# scale_fill_manual(values = c("black","white")) : 색상변경
ggplot(tg, aes(x = dose, y = length, fill = supp)) +
  geom_line(position = pd) +
  geom_point(shape = 21, size = 3, position = pd) +
  scale_fill_manual(values = c("black","white"))

# 4.6 음영 영역이있는 그래프 만들기
# geom_area()
# 시계열데이터
sunspot.year

sunspotyear <- data.frame(
  Year     = as.numeric(time(sunspot.year)),
  Sunspots = as.numeric(sunspot.year)
)
sunspotyear

ggplot(sunspotyear, aes(x = Year, y = Sunspots)) + geom_area()

ggplot(sunspotyear, aes(x = Year, y = Sunspots)) +
  geom_area(colour = "black", fill = "blue", alpha = .2)


ggplot(sunspotyear, aes(x = Year, y = Sunspots)) +
  geom_area(fill = "blue", alpha = .2) +
  geom_line()


# 4.7 누적 영역 그래프 만들기
# 채울 요소를 사용하고 geom_area() 매핑합니다
# fill = AgeGroup
head(uspopage,20)
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area()


ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues")

ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup, order = dplyr::desc(AgeGroup))) +
  geom_area(colour = NA, alpha = .4) +
  scale_fill_brewer(palette = "Blues") +
  geom_line(position = "stack", size = .2)

# 4.8 비례 누적 영역 그래프 만들기
# geom_area(position = "fill")
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(position = "fill", colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues")


# 레이블을 백분율로 인쇄하려면 scale_y_continuous(labels = scales::percent)
ggplot(uspopage, aes(x = Year, y = Thousands, fill = AgeGroup)) +
  geom_area(position = "fill", colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Blues") +
  scale_y_continuous(labels = scales::percent)


# 4.9 신뢰 영역 추가
climate
climate_mod <- climate %>%
  filter(Source == "Berkeley") %>%
  select(Year, Anomaly10y, Unc10y)

climate_mod
# geom_ribbon(aes(ymin = Anomaly10y - Unc10y, ymax = Anomaly10y + Unc10y), alpha = 0.2)
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_ribbon(aes(ymin = Anomaly10y - Unc10y, ymax = Anomaly10y + Unc10y), alpha = 0.2) +
  geom_line()

# 선그래프 2개로 신뢰영역 표시
ggplot(climate_mod, aes(x = Year, y = Anomaly10y)) +
  geom_line(aes(y = Anomaly10y - Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line(aes(y = Anomaly10y + Unc10y), colour = "grey50", linetype = "dotted") +
  geom_line()















































