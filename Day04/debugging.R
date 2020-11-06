# 디버깅
# 코드가 원하는대로 동작하지 않을때 그 이유를 확인하는 방법에는 크게 
# print(), sprint(), cat()을 사용해 메시지나 객체의 내용을 출력해보는 방법과 
# browser()를 사용한 코드 디버깅 방법이 있다.

print('Hello World!!!!')
print('Hello World!!!!')
print('Hello World!!!!')
print("")

cat('Hello World!!!!')
cat('Hello World!!!!')
cat("\n")
cat('Hello World!!!!')

print(1,2,3)
cat(1,2,3)
cat(1,2,3,sep = "-")
cat("\n")

name = "kimc"
age = 23
gender = T
# kimc(23, M)
sprintf("%s(%d,%s)", name,age,ifelse(gender, 'M','F'))
msg = sprintf("%s(%d,%s)", name,age,ifelse(gender, 'M','F'))
print(msg)

# 문자열 연결 함수
1 + 'A' + 2

paste(1,2,3,'A',123) # sep : space
paste(1,2,3,'A',123, sep = '~') # sep : ~

paste0(1,2,3,'A',123) # sep : None
paste0(1,2,3,'A',123, sep = '~') # sep : None

# ---------------------------------------------------------------------------
# 출력문을 이용한 디버깅
# ---------------------------------------------------------------------------
fibonacci = function(n){
  cat("args : ", n, "\n")
  if(n<=0){
    cat("return :", NA, "\n")
    return(NA)
  } 
  if(n==1 || n==2) {
    cat("return :", 1, "\n")
    return(1)
  }
  cat("return :", "fibonacci(",n-1,") + fibonacci(", n-2, ")\n")
  return(fibonacci(n-1)+fibonacci(n-2))
}

cat("fibonacci(5) =", fibonacci(5))

# ----------------------------------------------------------------------------------
# browser
# browser()가 호출되면 명령의 수행이 중지되고, 해당 시점부터 디버깅 모드가 시작된다.
# 실행하면 ‘Browse’ 라는 새로운 명령 표시줄이 출력된다.
# Browse 프롬프트에서는 c(ontinue) 또는 n(ext) 명령을 사용할 수 있다. 
# c를 입력하면 다음 browser()가 호출될 때 까지 코드의 수행을 재개한다.
# n을 입력하면 browser()로 정지된 그 다음부터 코드를 하나씩 차례로 수행한다.
# browser()의 수행을 마치려면 Q(uit)를 입력한다.
# ----------------------------------------------------------------------------------

sum_to_ten = function(){
  s = 0
  for(i in 1:10){
    s = s + i
    # dubgging
    if(i>=5){
      browser()  # dubgging start
    }
  }
  return(s)
}
sum_to_ten()



