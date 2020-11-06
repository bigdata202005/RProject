library(ggplot2)
library(gcookbook)
# 3.1 기본 막대 그래프 만들기
# x축을 나타내는 열과 y축을 나타내는 열을 가지는 데이터프레임을이용하여그리기
pg_mean
class(pg_mean)
# ggplot() + geom_col()
#      데이터, 
#      aes(x = group, y = weight) : 축을 지정한다.
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col()

df = data.frame(x=month.abb[1:3], y=sample(50:100,3))
df
ggplot(df, aes(x = x, y = y)) + geom_col()

BOD
str(BOD)
ggplot(BOD, aes(x = Time, y = demand)) + geom_col()
# x가 연속 (또는 숫자) 변수이면 막대가 약간 다르게 작동합니다.
# 각 실제 x 값에 최소값과 최대 값 사이의 가능한 x 값마다 하나씩 막대가 있습니다. 
# factor()를 사용하여 연속형 변수를 이산형 변수로 변환할 수 있습니다.
factor(BOD$Time)
ggplot(BOD, aes(x = factor(BOD$Time), y = demand)) + geom_col()

# 기본적으로 막대 그래프는 막대에 어두운 회색을 사용합니다. 
# 색상 채우기를 사용하려면 fill을사용합니다.
# 또한 기본적으로 채우기 주위에는 윤곽선이 없습니다. 
# 테두리 색상을 추가하려면 colour을사용합니다. 

# 색상값확인
colors()
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(fill = "steelblue3", colour = "tomato2")

# ggplot2에서 기본값은 미국식 철자 인 color대신 영국식 철자인 colour를 사용하는 것입니다. 
# 내부적으로 미국식 철자는 영국식 철자로 다시 매핑되므로 미국식 철자를 사용하면 여전히 작동합니다.
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(fill = "steelblue3", color = "tomato2")


# 3.2 막대 그룹화
# 두 개의 범주 형 변수 Cultivar 및 Date와 
# Weight라는 하나의 연속 변수가 있는 cabbage_exp 데이터 세트를 사용합니다 .
cabbage_exp
str(cabbage_exp)

# 채우기에 해당 변수를 매핑하여 그룹화 된 막대 그림을 생성할 수 있습니다.
# fill = Cultivar를 이용하여 그룹을 만듭니다.
# 또한 position = "dodge" 막대가 서로 수평으로 "회피"하도록 지시합니다. 
# 그렇지 않으면 누적 막대 그래프가 표시됩니다.
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +  geom_col(position = "dodge")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +  geom_col()

# 막대의 채우기 색상에 매핑 된 변수는 연속 변수가 아닌 범주형이어야합니다.
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Date)) +  geom_col(position = "dodge")

# 색상지정
# scale_fill_brewer(palette = "Pastel1")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") + scale_fill_brewer(palette = "Pastel1")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") + scale_fill_brewer(palette = "Pastel2")

# 개별 색상 지정
# scale_fill_manual(values = c( "#FF0000", "#FFCC00")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") + scale_fill_manual(values = c( "#FF0000", "#FFCC00"))

# 누락된 막대가있는 그래프는 다른 막대가 공간을 채 웁니다.
ce <- cabbage_exp[1:5, ]
ce
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") +
  scale_fill_brewer(palette = "Pastel1")


# 3.3 카운트 막대 그래프 만들기
# diamonds DataSet
diamonds
str(diamonds)
names(diamonds)
# factor : 3개(cut, color, clarity)
# num : 6개(carat, depth, table, x, y,z)
# int : 1개(price)

# x축 값만 지정한다. geom_bar()사용
ggplot(diamonds, aes(x = cut)) + geom_bar()
ggplot(diamonds, aes(x = carat)) + geom_bar()
# 히스토그램으로도 가능
ggplot(diamonds, aes(x = carat)) + geom_histogram()

# 3.4 막대 그래프에서 색상 사용
library(dplyr)
# uspopchange : 2000 년부터 2010 년까지 미국주의 인구 변화율이 포함되어 있습니다. 
uspopchange
str(uspopchange)

# 가장 빠르게 성장하는 상위 10 개 주를 선택하여 변화율을 그래프로 표시합니다. 
# 또한 지역 (북동부, 남부, 중북부 또는 서부)별로 막대의 색상을 지정합니다.
upc <- uspopchange %>%  arrange(desc(Change)) %>%  slice(1:10)
upc
# fill = Region을 지정하여 색상을 지정합니다
ggplot(upc, aes(x = Abb, y = Change, fill = Region)) + geom_col()

# scale_fill_brewer() 또는 scale_fill_manual()을 이용하여 사용자 색상 지정이 가능하다.
ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
  geom_col(colour = "red") +
  scale_fill_brewer(palette = "Greens") +
  xlab("State")

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
  geom_col(colour = "red") +
  scale_fill_brewer(palette = "Greens") +
  xlab("주이름") + ylab("인구변화율")

# 색상 확인하기
colors()
# palette 확인하기
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()

# 3.5 음수 및 양수 막대를 다르게 색칠하기

# 기후 데이터의 하위 집합을 사용하고 값이 양수인지 음수인지를 나타내는 pos라는 새 열을 만듭니다.
library(ggplot2)
library(gcookbook)
library(dplyr)
str(climate)
# climate 데이터에서 일부분만 추출하여 pos열을 추가한다
climate_sub <- climate %>%
  filter(Source == "Berkeley" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0)

climate_sub 
str(climate_sub)
#  fill = pos로 그룹을 지정
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +  geom_col()
# position = "identity" : 이전버전
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +  geom_col(position = "identity")

# 색상변경하고 범례없앰 : guide = FALSE
ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col() +
  scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = F)

ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity", colour = "black", size = 0.25) +
  scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = FALSE)

# 3.6 바 너비 및 간격 조정
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col()
# 바 좁게 또는 넓게 설정 하려면 geom_bar()에서 width를 지정합니다. 기본값은 0.9입니다. 
# 값이 클수록 막대가 넓어지고 값이 작을수록 막대가 좁아집니다 
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(width=0.3)
ggplot(pg_mean, aes(x = group, y = weight)) + geom_col(width=1.0)

# 그룹화 된 막대의 경우 기본값은 각 그룹 내에서 막대 사이에 공백이 없습니다. 
# 그룹 내의 막대 사이에 공백을 추가하려면 
# 너비를 더 작게 만들고 position_dodge을 크게 설정합니다
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_col(position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_col(width = 0.5, position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_col(width = 0.5, position = position_dodge(0.7))

# position_dodge를 width조다도 적게 사용하면 겹쳐서나온다
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + 
  geom_col(width = 0.8, position = position_dodge(0.4))

# 4가지 모두 같음
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(position = "dodge")
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(width = 0.9, position = position_dodge())
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(position = position_dodge(0.9))
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col(width = 0.9, position = position_dodge(width=0.9))


# 3.7 누적 막대 그래프 만들기
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) + geom_col()
# 범례를 역순으로 배열하기 : guides(fill = guide_legend(reverse = F))
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +  guides(fill = guide_legend(reverse = T))
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +  guides(fill = guide_legend(reverse = F))

# 누적 순서 지정 : position_stack(reverse = TRUE)
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = position_stack(reverse = TRUE)) +
  guides(fill = guide_legend(reverse = TRUE))

# 색상변경 
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "pink") +
  scale_fill_brewer(palette = "Greens")


# 3.8 비례 누적 막대 그래프 만들기
# 비율을 표시하는 누적 막대 그래프 (100 % 누적 막대 그래프라고도 함)를 만들고 싶습니다.
# geom_col(position = "fill")을사용함
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +  geom_col(position = "fill")

# scale_y_continuous(labels = scales::percent) : y축값을 0~1로 지정되는데 백분율로표시함
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent)

# 색상변경
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black", position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_brewer(palette = "Pastel1")


# ggplot2가 자동으로 비율을 계산하도록하는 대신 비례 값을 직접 계산할 수 있습니다. 

# percent_weight열추가
ce <- cabbage_exp %>%
  group_by(Date) %>%
  mutate(percent_weight = Weight / sum(Weight) * 100)

ce

# y축 값을 계산한 값으로 사용하여 같은 효과를 만듬
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) +  geom_col()


# 3.9 막대 그래프에 레이블 추가
# geom_text(aes(label = Weight), vjust = 1.5, colour = "white")
# 상단 아래 흰색으로 표시
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = 1.5, colour = "white")

# 상단 위에 회색으로 표시
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = -0.2)


# aes(label = ..count..), stat = "count" : 개수를 표시함
mtcars
table(mtcars$cyl)
# x축값만 지정하면 개수로 그려짐
ggplot(mtcars, aes(x = factor(cyl))) +  geom_bar()
# 레이블 표시 : 값표시
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  geom_text(aes(label = factor(cyl)), stat = "count", vjust = 1.5, colour = "white")
# 레이블 표시 : 개수표시
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


# 그룹화 된 막대 그래프의 경우 position = position_dodge ()를 지정하고 
# 닷지 너비에 대한 값도 지정해야합니다. 
# 기본 닷지 너비는 0.9입니다. 
# 막대가 더 좁기 때문에 레이블을 맞추기 위해 크기를 사용하여 
# 더 작은 글꼴을 지정해야 할 수도 있습니다. 
# 크기의 기본값은 5이므로 3을 사용하여 더 작게 만들 것입니다
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge") +
  geom_text(
    aes(label = Weight),
    colour = "white", size = 3,
    vjust = 1.5, position = position_dodge(.9)
  )

library(dplyr)

# Sort by the Date and Cultivar columns
ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))
ce

ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight))

ce
# 값표시
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), vjust = 1.5, colour = "white")

# 누적값표시
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = label_y), vjust = 1.5, colour = "white")

# 각 막대의 중앙에 레이블을 배치하려면
ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))

# Calculate y position, placing it in the middle
ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight) - 0.5 * Weight)
ce

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), colour = "white")

# label = paste(format(Weight, nsmall = 2), "kg")) : 접미사붙이기
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black") +
  geom_text(aes(y = label_y, label = paste(format(Weight, nsmall = 2), "kg")), size = 4) +
  scale_fill_brewer(palette = "Pastel1")


# 3.10 클리블랜드 점 플롯 만들기
# 클리블랜드 도트 플롯은 시각적 혼란을 줄이고 더 쉽게 읽을 수있는 막대 그래프의 대안입니다.
# geom_point() 사용
# tophitters2001 : 2001년 메이저 리그 야구 1 위 타자의 타율
tophit <- tophitters2001[1:25, ] # Take the top 25 from the tophitters data set
tophit
ggplot(tophit, aes(x = avg, y = name)) +   geom_point()

tophit[, c("name", "lg", "avg")]

# 
# 테마 시스템을 사용하여 수직 격자 선을 없애고 수평 격자 선을 점선으로 바꿉니다 
# theme_bw() : 흑백테마
ggplot(tophit, aes(x = avg, y = name)) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(colour = "grey60", linetype = "dashed")
  )

# reorder(name, avg) 정렬
ggplot(tophit, aes(x = avg, y = reorder(name, avg))) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(colour = "grey60", linetype = "dashed")
  )

# x,y축변경
# axis.text.x = element_text(angle = 60, hjust = 1) : x축의 값을 60도 회전하여 보여줌
ggplot(tophit, aes(x = reorder(name, avg), y = avg)) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_line(colour = "grey60", linetype = "dashed"),
    axis.text.x = element_text(angle = 60, hjust = 1)
  )

# geom_segment(aes(yend = name), xend = 0, colour = "grey50") : 선
ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),   # No horizontal grid lines
    legend.position = c(1, 0.55),           # Put legend inside plot area
    legend.justification = c(1, 0.5)
  )

# geom_point(size = 3, aes(colour = lg)) : 점추가
ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),   # No horizontal grid lines
    legend.position = c(1, 0.55),           # Put legend inside plot area
    legend.justification = c(1, 0.5)
  )

# 색상변경
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

# facet_grid(lg ~ ., scales = "free_y", space = "free_y") : 두 그룹을 분리
ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL"), guide = F) +
  theme_bw() +
  theme(panel.grid.major.y = element_blank()) +
  facet_grid(lg ~ .)

ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL"), guide = F) +
  theme_bw() +
  theme(panel.grid.major.y = element_blank()) +
  facet_grid(lg ~ ., scales = "free_y")

ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL"), guide = F) +
  theme_bw() +
  theme(panel.grid.major.y = element_blank()) +
  facet_grid(lg ~ ., scales = "free_y", space="free_y")








