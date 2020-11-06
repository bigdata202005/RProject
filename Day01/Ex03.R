lotto <- function(){
  list <- seq(1:45)
  for(i in 1:10){
    lotto <- sample(list,6)
    lotto <- sort(lotto)
    print(lotto, end="\n")
  }
}
lotto()

