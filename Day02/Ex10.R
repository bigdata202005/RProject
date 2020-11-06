# R에 기본으로 내장된 데이터 셋은 data() 함수를 통해 쉽게 불러올 수 있습니다. 
data()

# 현재 사용자 환경에 설치된 패키지가 포함하고 있는 데이터 셋에 대한 정보를 불러옵니다.
Package_Data_List = data(package = .packages(all.available = TRUE))
Package_Data_List
# data("mtcars")   # mtcars 데이터 셋을 불러옵니다.
# data('iris')
? iris   # iris 데이터 셋에 대한 정보를 확인합니다.
iris
dni = dimnames(iris)
dni
class(iris)
dim(iris)
head(iris)
tail(iris)
names(iris)

? iris3   # iris3 데이터 셋에 대한 정보를 확인합니다.
iris3
dni = dimnames(iris3)
dni
class(iris3)
dim(iris3)
head(iris3)
tail(iris3)
names(iris3)


cars
class(cars)
dim(cars)
head(cars)
tail(cars)
names(cars)
cars$speed
cars$dist


data("mtcars")   # mtcars 데이터 셋을 불러옵니다.

