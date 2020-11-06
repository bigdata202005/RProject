# IF, FOR, WHILE 문
# R의 IF문 구조는 다른 언어와 큰 차이가 없다.
if(T){
  print('TRUE')
  print('Hello')
}else{
  print('FALSE')
  print('World')
}
if(F){
  print('TRUE')
  print('Hello')
}else{
  cat('FALSE')
  cat('World')
}

for(i in 1:10){
  cat(i)
  cat(' ')
}
for(i in c('a','b','c','d')){
  cat(i)
  cat(' ')
}

i = 0
while(i<10){
  cat(i)
  cat(' ')
  i = i + 1
}

# 행렬 연산
# 행렬의 기본적인 연산인 합, 곱, 전치행렬(transpose), 역행렬을 다음과 같이 계산할 수 있다.
mat1 = matrix(c(1:4), nrow = 2)
mat1
mat1 + mat1
mat1 %*% mat1
mat2 = t(mat1)
mat1
mat2
mat3 = solve(mat1)
mat3
mat1 %*% mat3



# NA의 처리
# 결측치가 데이터에 포함되어 있을 경우 연산결과가 다음과 같이 NA로 바뀌어버리므로 주의가
# 필요하다.

NA
NA + 1
NA - 1
NA * 1
NA / 1
sum(c(1,2,3,4,5))
sum(c(1,2,3,4,5,NA))
sum(c(1,2,3,4,5,NA), na.rm = T)
sum(c(1,2,3,4,5,NA), na.rm = F)
? sum
sum(1:5)
sum(1, 2, 3, 4, 5)
sum(1:2, 3:5)
sum(1:5, NA)
sum(1:5, NA, na.rm = TRUE)


# 한편 잘알려진 머신 러닝 패키지 중 하나인 caret: Classification and Regression Training[7]
# 은 na.omit, na.pass, na.fail등을 na.action이라는 인자로 받아서 NA 처리를 어떻게 할지 결정
# 한다. 다음 예제는 이 셋의 차이를 보여준다.

df = data.frame(a=c(1, 2, 3), b=c(" a" , NA , " c" ), c=c(" a" , " b" , NA))
df
class(df)
na.omit(df)
na.pass(df)
na.fail(df)

# function
lotto = function(){
  result = sample(1:45,6)
  result = sort(result)
  print(result)
}
lotto()

lotto2 = function(){
  result = sample(1:45,6)
  result = sort(result)
  return(result)
}
l = lotto2()
l
class(l)
str(l)

fibo = function(x){
  if(x==1 ||  x==2){
    return (1)
  }
  return(fibo(x-1)+fibo(x-2))
}

for(i in 1:10){
  cat(fibo(i))
  cat(' ')
}

view = function(x, y){
  cat(class(x))
  cat(" : ")
  print(x)
  cat(class(y))
  cat(" : ")
  print(y)
}

view(1, 2)
view(x = 'A', y=10)
view(y=10, x=T)

# R의 함수들의 도움말을 살펴보면 ‘...’를 인자 목록에 적은 경우를 종종 볼 수 있다. 함수의
# 인자에서 사용하는 ‘...’ 는 임의의 인자들을 받아서 다른 함수에 넘겨주는 용도로 주로 사용된
# 다. 예를들어 다음에 보일 함수 g()는 인자 z는 자기 자신이 처리하지만 나머지 인자들은 함수
# f로 넘긴다.

g = function(z, ...) {
  print(z)
  print(...)
  view(...)
}
g(1, 2, 3)

g2 = function(z,...) {
  view(...)
}
g2(1, 2, 3)

# 함수안에 또 다른 함수를 정의하여 사용할 수 있다. 
# 이를 중첩함수(Nested Function)이라고 부른다. 

fn = function(x,y){
  cat(class(x))
  cat(" : ")
  print(x)
  inner_fn = function(y){
    cat('inner function : ')
    cat(class(x))
    cat(" : ")
    print(x)
  }
  inner_fn(y)
}
fn(5,'A')

inner_fn('Z')  # Error
fn.inner_fn('Z') # Error

# 스코프(Scope)
# 코드에 기술한 변수 등을 지칭하는 이름이 어디에서 사용가능한지를 정하는 규칙을 스코프라
# 고 한다. R에서는 대부분의 현대적인 프로그래밍 언어가 그러하듯이 
# lexical scope(또는 static scope라고도 함)를 사용한다.

# 콘솔에서 변수를 선언하면 모든 곳에서 사용 가능한 변수가 된다.
a = 100;
a

fn2 = function(){
  cat(class(a))
  cat(" : ")
  print(a)
}

fn2()

# 함수 내부에서 변수 이름이 주어졌을 때 
# 그 변수를 찾는 범위는 함수 내부가 우선된다.
fn3 = function(){
  a = 'Q'
  b = 200
  cat(class(a))
  cat(" : ")
  print(a)
}
fn3()
a
# 마찬가지로 함수 내부에 정의한 이름은 바깥에서 접근 할 수 없다.
b
# 다음 코드에서 rm(list=ls())는 모든 객체를 삭제하는 명령이다.
ls()
? rm
rm(list = ls())
ls()
# 만약 함수 내부에도, 전역 변수로도 없는 이름을 사용하면 에러가 된다. 
fn2 = function(){
  cat(class(a))
  cat(" : ")
  print(a)
}
fn2()

rm('fn2')

fn = function(x){
  a = 10
  ifn = function(y){
    print(a+y)
  }
  ifn(x)
  print(x+a)
}

fn(100)
print(a)


rm(list=ls())
a = 1000
fn = function(x){
  ifn = function(y){
    print(a+y)
  }
  ifn(x)
  print(x+a)
}
fn(100)
print(a)

rm(list=ls())
a = 123
fn = function(x){
  a = 10
  ifn = function(y){
    a = 20
    print(a)  # 20
  }
  ifn(x)
  print(a)  # 10
}
fn(5)
print(a)


