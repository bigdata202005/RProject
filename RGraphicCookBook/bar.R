# pg_mean data set
library(gcookbook)

pg_mean
# group weight
# 1  ctrl  5.032
# 2  trt1  4.661
# 3  trt2  5.526

# geom_col() : 막대그래프
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col()

# There's no entry for Time == 6
BOD
#>   Time demand
#> 1    1    8.3
#> 2    2   10.3
#> 3    3   19.0
#> 4    4   16.0
#> 5    5   15.6
#> 6    7   19.8

# Time is numeric (continuous)
str(BOD)
#> 'data.frame':    6 obs. of  2 variables:
#>  $ Time  : num  1 2 3 4 5 7
#>  $ demand: num  8.3 10.3 19 16 15.6 19.8
#>  - attr(*, "reference")= chr "A1.4, p. 270"


time1 = BOD$Time
class(time1)
str(time1)
is.vector(time1)
# 6까지 그려진다.
# x : 1 ~ 7
ggplot(BOD, aes(x = Time, y = demand)) + geom_col()

time_factor = factor(time1)
class(time_factor)
is.vector(time_factor)
# x축값을 팩터로 바꿔줘야 있는 값만 그려진다
ggplot(BOD, aes(x = time_factor, y = demand)) + geom_col()

# 한번에 처리가 가능하다 : 축값을 팩터로 바로적용
ggplot(BOD, aes(x = factor(Time), y = demand)) + geom_col()

# 테두리와 채움 색상지정
pg_mean
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(fill = "lightblue", colour = "black")


# Grouping Bars Together
cabbage_exp
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(position = "dodge")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(position = "dodge") + scale_fill_brewer(palette = "Pastel1") 

# 3.3 Making a Bar Graph of Counts
library(ggplot2)
library(gcookbook)
#diamonds데이터 세트는 하나의 다이아몬드에 대한 정보를 나타내고, 각각의 행 53,940을 갖는다
diamonds
table(diamonds$cut)
ggplot(diamonds, aes(x = cut)) +  geom_bar()

# 3.4 막대 그래프에서 색상 사용
# 이 예 에서는 uspopchange 데이터 세트를 사용합니다.
# 여기에는 2000 년부터 2010 년까지 미국주의 인구 변화율이 포함되어 있습니다. 
# 가장 빠르게 성장하는 상위 10개 주를 선택하여 변화율을 그래프로 표시합니다. 
# 또한 지역 (북동부, 남부, 중북부 또는 서부)별로 막대의 색상을 지정합니다.

library(dplyr)
# 먼저 상위 10 개 주를 선택하세요.
uspopchange
uspopchange %>% arrange(desc(Change))
uspopchange %>% arrange(desc(Change)) %>% slice(1:10)
upc <- uspopchange %>% arrange(desc(Change)) %>% slice(1:10)
upc
ggplot(upc, aes(x = Abb, y = Change, fill = Region)) + geom_col()

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) + geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) + geom_col(colour = "blue") +
  scale_fill_manual(values = c("pink", "skyblue")) + xlab("주이름")

# 3.5 음수 및 양수 막대를 다르게 색칠하기
# 기후 데이터의 하위 집합을 사용하고 값이 양수인지 음수인지를 나타내는 pos라는 새 열을 만듭니다.
climate
head(climate)
climate_sub <- climate %>%
  filter(Source == "Berkeley" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0)

head(climate_sub)
# 막대와 함께 position = "identity"를 사용합니다.
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) + geom_col(position = "identity")

# guide = FALSE : 범례표시하지말아라
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity", colour = "black", size = 0.25) +
  scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = FALSE)

# 3.6 바 너비 및 간격 조정
# 바 좁게 또는 넓게하려면 설정 width에서 geom_bar(). 기본값은 0.9입니다. 
# 값이 클수록 막대가 넓어지고 값이 작을수록 막대가 좁아집니다

pg_mean
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col()
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(width=0.5)
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(width=1)

# 그룹 내의 막대 사이에 공백을 추가하려면 너비를 더 작게 만들고 
# position_dodge을 다음보다 크게 설정합니다 
cabbage_exp
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = position_dodge(0.7))

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.8, position = position_dodge(0.4))


# 3.7 누적 막대 그래프 만들기
# geom_bar()변수를 사용 하고  fill 매핑합니다
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col()

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  guides(fill = guide_legend(reverse = TRUE))

# position_stack(reverse = TRUE). 막대 순서와 일치하도록 범례의 순서를 반대로해야합니다.
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = position_stack(reverse = TRUE)) +
  guides(fill = guide_legend(reverse = TRUE))

# 테두리색상/ Pastel색상지정
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black") +
  scale_fill_brewer(palette = "Pastel1")

# 3.8 비례 누적 막대 그래프 만들기
#     비율을 표시하는 누적 막대 그래프 (100 % 누적 막대 그래프라고도 함)를 만들고 싶습니다.

# geom_col(position = "fill")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill")
# y값 : 0 ~ 1

# 레이블을 백분율로 인쇄 : scale_y_continuous(labels = scales::percent).
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill") + scale_y_continuous(labels = scales::percent)


ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black", position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_brewer(palette = "Pastel1")


# ggplot2가 자동으로 비율을 계산하도록하는 대신 비례 값을 직접 계산할 수 있습니다. 

cabbage_exp
# percent_weight 열추가
ce <- cabbage_exp %>%
  group_by(Date) %>%
  mutate(percent_weight = Weight / sum(Weight) * 100)

ce
# 추가된 열을 y값으로사용
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) +
  geom_col()

# 3.9 막대 그래프에 레이블 추가
# geom_text()그래프에 추가 하십시오. 
# x, y 및 텍스트 자체에 대한 매핑이 필요합니다. 
# vjust(수직 정렬)하면 텍스트를 막대 상단 위 또는 아래로 이동할 수 있습니다 .

# Below the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = 1.5, colour = "white")

# Above the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = -0.5)

# 값대신 개수를 표시하려면 : label = ..count..,  stat = "count"
mtcars$cyl
factor(mtcars$cyl)
table(factor(mtcars$cyl))

ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  geom_text(aes(label = cyl), stat = "count", vjust = 1.5, colour = "white")


ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")


# Adjust y limits to be a little higher
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = -0.2) +
  ylim(0, max(cabbage_exp$Weight) * 1.05)

# Map y positions slightly above bar top - y range of plot will auto-adjust
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(y = Weight + 0.1, label = Weight))


ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge") +
  geom_text(
    aes(label = Weight),
    colour = "white", size = 3,
    vjust = 1.5, position = position_dodge(.9))

# 누적 막대 그래프에 레이블을 붙이려면 각 스택의 누적 합계를 찾아야합니다. 
# Date별로 묶어서 Cultivar 역순정렬
ce <- cabbage_exp %>% arrange(Date, rev(Cultivar))
ce
# label_y라는 Date별로 누적 합계 열을 추가
ce <- ce %>% group_by(Date) %>% mutate(label_y = cumsum(Weight))
ce

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), vjust = 1.5, colour = "white")


ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))

# Calculate y position, placing it in the middle
ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight) - 0.5 * Weight)

ce
# 레이블을 중앙에 배치
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), colour = "white")

# 단위를 붙여서 사용
# label = paste(format(Weight, nsmall = 2), "kg") 
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black") +
  geom_text(aes(y = label_y, label = paste(format(Weight, nsmall = 2), "kg")), size = 4) +
  scale_fill_brewer(palette = "Pastel1")

# 3.10 클리블랜드 점 플롯 만들기
# 클리블랜드 도트 플롯은 시각적 혼란을 줄이고 더 쉽게 읽을 수있는 막대 그래프의 대안입니다.
tophit <- tophitters2001[1:25, ]
tophit

ggplot(tophit, aes(x = avg, y = name)) + geom_col()
ggplot(tophit, aes(x = avg, y = name)) + geom_point()

tophit[, c("name", "lg", "avg")]

ggplot(tophit, aes(x = avg, y = reorder(name, avg))) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(colour = "grey60", linetype = "dashed")
  )


ggplot(tophit, aes(x = reorder(name, avg), y = avg)) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_line(colour = "grey60", linetype = "dashed"),
    axis.text.x = element_text(angle = 60, hjust = 1)
  )

# Get the names, sorted first by lg, then by avg
nameorder <- tophit$name[order(tophit$lg, tophit$avg)]
nameorder
# Turn name into a factor, with levels in the order of nameorder
tophit$name <- factor(tophit$name, levels = nameorder)
tophit$name


ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL")) +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),   # No horizontal grid lines
    legend.position = c(1, 0.55),           # Put legend inside plot area
    legend.justification = c(1, 0.5)
  )

ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL"), guide = FALSE) +
  theme_bw() +
  theme(panel.grid.major.y = element_blank()) +
  facet_grid(lg ~ ., scales = "free_y", space = "free_y")
