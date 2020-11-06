# 스코프
# 코드에 기술한 이름(예를 들면, 변수명)이 어디에서 사용 가능한지를 정하는 규칙을 
# 스코프Scope라고 한다. 

# R에서는 대부분의 현대적인 프로그래밍 언어가 그러하듯이 문법적 스코프(lexical scope)
# 사용하며, 문법적 스코프는 변수가 정의된 블록 내부에서만 변수를 접근할 수 있는 규칙을
# 말한다.

# 콘솔에서 변수를 선언하면 모든 곳에서 사용 가능한 전역 변수가 된다. 
# 이 변수는 현재 실행 중인 R 세션 동안 유효하다. 
# 따라서 코드를 여러 파일에 나눠놓고 source()를 사용해 실행할 경우 다른 파일에서도 
# 해당 변수를 사용할 수 있다

# 전역변수
global_x = 10
print(global_x)

fn = function(){
  local_x = 11
  print(global_x) # 전역변수
  print(local_x)  # 지역변수
}
fn()

# 함수 내부에 정의한 이름은 바깥에서 접근 할 수 없다.
print(local_x)  # 지역변수
# Error in print(local_x) : 객체 'local_x'를 찾을 수 없습니다


x = 10
cat("x =", x, '\n')
fn2 = function(){
  x = 11
  cat("x =", x, '\n')  # 지역변수 우선적용
}
fn2()
cat("x =", x, '\n')


# 함수 내부에서 전역 변수로도 없는 이름을 사용하면 에러가 된다.
fn3 = function(){
  cat("y =", y, '\n')  # 지역변수 우선적용
}
fn3()
# Error in cat("y =", y, "\n") : 객체 'y'를 찾을 수 없습니다

# 전역변수와 지역변수가 겹칠경우 전역변수에 접근하기 위해서는 <<-연산자를 사용한다

x = 10
cat("x =", x, '\n')
fn2 = function(){
  x = 123
  x <<- 11             # 전역변수 접근
  cat("x =", x, '\n')  # 지역변수 우선적용
}
fn2()
cat("x =", x, '\n')    # 11

print(ch)
# Error in print(ch) : 객체 'ch'를 찾을 수 없습니다
for(ch in letters){
  cat (ch, ' ')
}
print(ch) # for문에서 사용한 변수 밖에서 사용 가능


# 값에 의한 전달(call By Value)
# R에서는 모든 것이 객체이다. 또 객체는 함수 호출시 일반적을 값이 복사되어 전달된다.
v1 = sort(sample(1:45,6,replace = F))
v1

change_vector = function(v){
  for(i in 1:length(v)){
    v[i] = v[i] + 1  # 변경
  }
  print(v)
  # return(v)
}
change_vector(v1)
v1  #원본유지

v1 = change_vector(v1) # 대입
v1


