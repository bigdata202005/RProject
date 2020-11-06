# foreach
# for 문 등을 대체할 수 있는 루프문을 위한 함수이다.
# for 문과의 가장 큰 차이는 반환값이 있고, %do% 문을 사용해 
# 블럭을 지정한다는 점이다.
for(i in 1:10){
  cat(i, ' ')
}
install.packages("foreach")
library(foreach)
foreach(i=1:10)%do%{
  i
}
list1 = foreach(i=1:10)%do%{
  i
}
class(list1)
list1
list1[1:3]
list1[[1]]
names(list1)
names(list1) = LETTERS[1:10]
names(list1)
list1['A']

# R 내장상수
pi
letters
LETTERS
month.abb
month.name
# 현재로케일의 월이름 얻기
list(format(ISOdate(2000, 1:12, 1), "%B"))
list(format(ISOdate(2000, 1:12, 1), "%b"))
list(format(ISOdate(2020, 7:12, 30), "%B"))

# .combine=c를 지정해 처음부터 벡터로 결과를 받을 수도 있다.
v1 = foreach(i=1:10, .combine = c )%do%{
  i
}
class(v1)
v1
is.vector(v1)
# data.frame return
df1 = foreach(i=1:10, .combine = rbind )%do%{
  data.frame(val=i)
}
class(df1)
df1
is.data.frame(df1)

df2 = foreach(i=1:10, .combine = cbind )%do%{
  data.frame(val=i)
}
class(df2)
df2
is.data.frame(df2)
# 이름이 모두 같다. 이름을 변경해보자
names(df2)
# 이름을 리스트로 만듬
l1 = list(format(ISOdate(2000, 1:10, 1), "val%b"))
l1
class(l1)
# 리스트를 벡터로
l1 = unlist(l1)
# 이름 변경
names(df2) = l1
names(df2)
df2

# .combine에 연산자를 지정하면 foreach를 사용해 
# 함수형 언어에서 제공되는 Reduce를 구현할 수 있다.
foreach(i=1:10, .combine = "+" )%do%{
  i
}
foreach(i=1:10, .combine = "*" )%do%{
  i
}

# doMC
# doMC[14]는 멀티코어를 활용해 프로그램을 병렬적으로 수행할 수 있게 해준다. 
# 멀티 코어를 활용한다는 뜻은 여러개의 프로세스를 실행하고 각 프로세스가 개별 
# CPU 코어에서 돌아가게한다는 의미이다.
# install.packages("doMC")
# library(doMC)
# registerDoMC(cores = 4)
# 만약 인자없이 registerDoMC()를 실행하면 기본값인 코어 갯수의 절반이 프로세스 수로
# 설정된다.


# 테스트

# R에는 유닛 테스팅을 위한 패키지로 RUnit[15], testthat[16, 17] 등이 있으며,
# 이 절에서는그 중 좀 더 사용하기 편리하다고 생각되는 
# testthat에 대해서 설명하도록 하겠다.
library(testthat)
# 함수 작성 
fibo = function(n){
  if(n<=0){
      return(NA) 
  }
  if(n==1 || n==2){
    return(1)
  }else{
    return(fibo(n-1)+fibo(n-2))
  }
}
# 일반적인 함수 테스트
for(i in 1:10){
  cat(fibo(i), ' ')
}
# 테스트유닛을 이용한 함수 테스트
expect_equal(fibo(1), 1)
expect_equal (1, fibo (0))
expect_equal (NA, fibo (0))

# 기대값과 실제 반환값을 비교하기위해 사용하는 함수에는 
# expect_true(), expect_false(), expect_is(), expect_equal()
# 등이 있다.

expect_true(1==1)
expect_true(1==2)
# test_that함수를 이용하여 여러개 테스트를 묶어서 할 수 있다. 
test_that(" base case" , {
  expect_equal (1, fibo(0))
  expect_equal (1, fibo(1))
})

test_that(" base case2" , {
  expect_equal (NA, fibo(0))
  expect_equal (1, fibo(1))
})





