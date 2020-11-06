# 함수
# 함수란 하나의 작업을 수행하기 위해 독립적으로 설계된 프로그램 코드의 집합입니다.
# 프로그램은 이러한 함수들로 구성되며, 포함된 함수들을 사용하여 프로그램의 목적을 달성하게 됩니다.

# 함수명 <- function(인자, 인자, ....) { 함수 본문 }
my_sum = function(n){
  sum=0
  for(i in 1:n){
    sum = sum + i
  }
  return(sum)
}

my_sum(10)
my_sum(1000)

my_factorial = function(n){
  fac = 1
  while(n>=1){
    fac = fac * n
    n = n - 1
  }
  return(fac)
}

# 재귀 호출(recursive call) :  함수 내부에서 함수가 자기 자신을 또다시 호출하는 행위를 의미
my_factorial2 = function(n){
  return(ifelse(n<=1,1 ,n * my_factorial2(n-1)))
}


for(i in 1:10){
  cat(factorial(i), my_factorial(i), my_factorial2(i), "\n", sep = "  ")
}


fibonacci  = function(n){
  if(n<=0){
    return(NA)
  }
  if(n==1 || n==2){
    return(1)
  }
  return(fibonacci(n-2) + fibonacci(n-1))
}

for(i in 1:10){
  cat(fibonacci(i), ' ')
}

is.leap_year = function(year){
  return (year%%400==0 || year%%4==0 && year%%100!=0)
}

for(i in 2000:2040){
  print(sprintf("%d : %s",i,(ifelse(is.leap_year(i), '윤년', '평년'))))
}

make_vector = function(x,y,z){
  return(c(x,y,z))
}

v1 = make_vector(1,2,3)
v1
is.vector(v1)

v2 = make_vector(x = 1,z = 2,y =3)
v2
is.vector(v2)

# ... : 가변인수
make_vector2 = function(...){
  return(c(...))
}

v3 = make_vector2(1,2,3)
v3
is.vector(v3)

v4 = make_vector2(1,2,3,4,5,6,7,8,9,10)
v4
is.vector(v4)


# 중첩함수(Nested Function) : 함수안에 또 다른 함수를 정의하여 사용할 수 있다. 

outer_fn = function(n){
  
  inner_fn = function(m){
    return(m**2)
  }
  
  n = n + 1
  return (inner_fn(n))
}

outer_fn(3)
outer_fn(5)


# 클로저(Closure)는 독립적인 변수(로컬로 사용되지만 둘러싼 범위에서 정의 된 변수)를 
# 참조하는 함수입니다. 이 함수들은 생성될 당시의 환경을 기억 합니다.

# 함수를 리턴하는 함수
closure_fn = function(n){
  return(function(m){
    return(n * m)
  })
}

closure_fn(5)(4)
# 전달된 값이 변수별로 저장되어있다
gugu5 = closure_fn(5)
gugu8 = closure_fn(8)
for(i in 1:9){
  cat(gugu5(i), gugu8(i), '\n')
}

# 기본 인수값
area = function(w = 10, h = 10){
  return (w*h)
}
area()
area(5)
area(5,8)

area2 = function(w = 10, h){
  return (w*h)
}
area2()
area2(5)
# Error in area2() : 기본값이 없는 인수 "h"가 누락되어 있습니다
area2(h=5)
area2(6, 5)
area2(h = 6, w = 5)

area3 = function(w, h = 10){
  return (w*h)
}
area3(w=10)
area3(10, 8)
