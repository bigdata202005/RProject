# 산점도그래프
# geom_point()

heightweight
str(heightweight)
# heightweight 중에서 지정열만 취하기
heightweight %>% select(ageYear, heightIn)

ggplot(heightweight, aes(x = ageYear, y = heightIn)) +  geom_point()
# shape = 21 : 모양지정
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 21)

# size = 3.5 : 크기 지정
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(size = 3.5)


# 5.2 모양 또는 색상을 사용하여 포인트 그룹화
# shape, colour를사용하여 그룹화지정
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex, colour = sex)) +
  geom_point()

# scale_shape_manual, scale_colour_brewer를사용하여 사용자가 지정
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex, colour = sex)) +
  geom_point(size=2) +
  scale_shape_manual(values = c(1, 2)) +
  scale_colour_brewer(palette = "Set1")


# 5.3 다른 점 모양 사용
# geom_point(shape = 3)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 1)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 2)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 3)
ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(shape = 22)

# 성별로 그룹화 한후에 모양다르게 지정 : scale_shape_manual(values = c(1, 4))
ggplot(heightweight, aes(x = ageYear, y = heightIn, shape = sex)) +
  geom_point(size = 3) +
  scale_shape_manual(values = c(1, 6))

# weightgroup열추가
hw <- heightweight %>%
  mutate(weightgroup = ifelse(weightLb < 100, "< 100", ">= 100"))

head(hw)

# 하나의 변수는 점의 모양으로 표시되고 다른 변수는 점의 채우기 (비어 있거나 채워짐)로 표시 될 수 있습니다. 
# scale_shape_manual, scale_fill_manual() 
# fill = weightgroup : 채움/외곽선 지정
# scale_fill_manual(
#   values = c(NA, "black"), NA는채우기없음
#   guide = guide_legend(override.aes = list(shape = 21))
# )
ggplot(hw, aes(x = ageYear, y = heightIn, shape = sex, fill = weightgroup)) +
  geom_point(size = 2.5) +
  scale_shape_manual(values = c(21, 24)) +
  scale_fill_manual(
    values = c(NA, "black"),
    guide = guide_legend(override.aes = list(shape = 21))
  )

# 5.4 연속 변수를 색상 또는 크기에 매핑
heightweight %>%
  select(sex, ageYear, heightIn, weightLb)

# 색상변화 : colour = weightLb
ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = weightLb)) +
  geom_point()

# 크기변화 : size = weightLb
ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point()


# 점의크기 ggplot2의 기본값이 1에서 6mm 범위
range(heightweight$weightLb)

size_range <- range(heightweight$weightLb) / max(heightweight$weightLb) *  6
size_range

# 크기를지정한다
ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point() +
  scale_size_continuous(range = size_range)

ggplot(heightweight, aes(x = ageYear, y = heightIn, size = weightLb)) +
  geom_point() +
  scale_size_area()


ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = weightLb, shape = sex)) +
  geom_point()


# 5.5 오버 플로팅 처리
# 53,940 x 10의데이터
head(diamonds)
str(diamonds)

diamonds_sp <- ggplot(diamonds, aes(x = carat, y = price))

diamonds_sp + geom_point()

#투명도를지정하여해결
diamonds_sp + geom_point(alpha = .1)
diamonds_sp + geom_point(alpha = .01)

# 사각형으로 묶어서해결 :  stat_bin2d()
diamonds_sp + stat_bin2d()

diamonds_sp +
  stat_bin2d(bins = 50) +
  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 6000))

# 육각형으로 묶어서해결 :  stat_binhex()
install.packages("hexbin")
library(hexbin)

diamonds_sp +  stat_binhex() +
  scale_fill_gradient(low = "lightblue", high = "red", limits = c(0, 8000))

diamonds_sp +
  stat_binhex() +
  scale_fill_gradient(
    low = "lightblue", high = "red", limits = c(0, 6000),
    breaks = c(0, 250, 500, 1000, 2000, 4000, 6000)
  )


head(ChickWeight)
str(ChickWeight)

ChickWeight %>% select(Time,weight)

cw_sp <- ggplot(ChickWeight, aes(x = Time, y = weight))
cw_sp + geom_point()
# position_jitter(width = .5, height = 0) : 겹치는 부분을 옆으로 벌려서 표시
cw_sp + geom_point(position = position_jitter(width = .5, height = 0))

# Box그래프의 겹치는 부분을 그룹을 주어서표시
cw_sp +  geom_boxplot()
cw_sp +  geom_boxplot(aes(group = Time))

# 5.6 적합 회귀 모형 선 추가
# 산점도에 선형 회귀선을 추가하려면을 추가하고 stat_smooth()사용
# lm()(선형 모델) 함수

hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn))

hw_sp + geom_point() + stat_smooth(method = lm)

# 기본적으로 stat_smooth()회귀 적합도에 대한 95 % 신뢰 영역도 추가합니다. 
# 신뢰 구간은의 값을 수정하여 변경 level하거나 다음을 사용하여 비활성화 할 수 있습니다 
# se = FALSE

# 99 % 신뢰 영역도 추가
hw_sp + geom_point() + stat_smooth(method = lm, level = 0.99)
hw_sp + geom_point() + stat_smooth(method = lm, level = 0.5)

# 신뢰 영역 제외
hw_sp + geom_point() + stat_smooth(method = lm, se = T)
hw_sp + geom_point() + stat_smooth(method = lm, se = F)

# colour = "black" : 선 색상 지정
hw_sp + geom_point(colour = "grey60") +
  stat_smooth(method = lm, se = F, colour = "red")


# 메서드를 지정하지 않고 추가하면 기본적으로 LOESS (로컬 가중치 다항식) 곡선이 사용됩니다 .
hw_sp + geom_point(colour = "grey60") +  stat_smooth()



library(dplyr) 
library(MASS) # Load MASS for the biopsy data set

biopsy_mod <- biopsy %>% mutate(classn = recode(class, benign = 0, malignant = 1))
biopsy_mod
head(biopsy_mod)

ggplot(biopsy_mod, aes(x = V1, y = classn)) +
  geom_point(
    position = position_jitter(width = 0.3, height = 0.06),
    alpha = 0.4,
    shape = 21,
    size = 1.5
  ) +  stat_smooth(method = glm, method.args = list(family = binomial))


hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  scale_colour_brewer(palette = "Set1")

hw_sp +  geom_smooth()
hw_sp + geom_smooth(method = lm, se = FALSE, fullrange = TRUE)


# 5.7 기존 모델에서 적합 선 추가
library(gcookbook)
# 데이터생성
model <- lm(heightIn ~ ageYear + I(ageYear^2), heightweight)
model
xmin <- min(heightweight$ageYear)
xmax <- max(heightweight$ageYear)
xmin
xmax
predicted <- data.frame(ageYear = seq(xmin, xmax, length.out = 100))
predicted

predicted$heightIn <- predict(model, predicted)
predicted

# 산점도 그래프 그리기
hw_sp <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) + geom_point(colour = "grey40")
hw_sp
# 선추가
hw_sp + geom_line(data = predicted, size = 1)

# 데이터를 생성하는함수
predictvals <- function(model, xvar, yvar, xrange = NULL, samples = 100, ...) {
  if (is.null(xrange)) {
    if (any(class(model) %in% c("lm", "glm")))
      xrange <- range(model$model[[xvar]])
    else if (any(class(model) %in% "loess"))
      xrange <- range(model$x)
  }
  
  newdata <- data.frame(x = seq(xrange[1], xrange[2], length.out = samples))
  names(newdata) <- xvar
  newdata[[yvar]] <- predict(model, newdata = newdata, ...)
  newdata
}

modlinear <- lm(heightIn ~ ageYear, heightweight)
modloess  <- loess(heightIn ~ ageYear, heightweight)
modlinear
modloess


lm_predicted    <- predictvals(modlinear, "ageYear", "heightIn")
loess_predicted <- predictvals(modloess, "ageYear", "heightIn")

lm_predicted
loess_predicted

hw_sp +
  geom_line(data = lm_predicted, colour = "red", size = .8) +
  geom_line(data = loess_predicted, colour = "blue", size = .8)


biopsy_mod <- biopsy %>%  mutate(classn = recode(class, benign = 0, malignant = 1))
biopsy_mod
fitlogistic <- glm(classn ~ V1, biopsy_mod, family = binomial)
fitlogistic
glm_predicted <- predictvals(fitlogistic, "V1", "classn", type = "response")
glm_predicted
ggplot(biopsy_mod, aes(x = V1, y = classn)) +
  geom_point(
    position = position_jitter(width = .3, height = .08),
    alpha = 0.4,
    shape = 21,
    size = 1.5
  ) + geom_line(data = glm_predicted, colour = "#1177FF", size = 1)


# 5.8 여러 기존 모델에서 적합 선 추가
library(gcookbook)
library(dplyr)

models <- heightweight %>% group_by(sex) %>% do(model = lm(heightIn ~ ageYear, .)) %>%  ungroup()
models
models$model

predvals <- models %>%
            group_by(sex) %>%
            do(predictvals(.$model[[1]], xvar = "ageYear", yvar = "heightIn"))

predvals


ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point() +
  geom_line(data = predvals)

# Using facets instead of colors for the groups
ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point() +
  geom_line(data = predvals) +
  facet_grid(. ~ sex)




















































