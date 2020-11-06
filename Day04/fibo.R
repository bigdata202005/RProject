# 피보나치수열
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

# n~m까지의 합을 구하는 함수
nm_sum = function(n, m){
  s = 0
  # if(n>m){
  #   t = n
  #   n = m
  #   m = t
  # }
  for(i in n:m ){
    s = s + i
  }
  return(s)
}

# nm_sum(1,10)
# 1:10
# 10:1
