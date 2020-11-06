# .libPaths()를 실행하면 패키지가 설치되어 있는 위치를 알려준다.
.libPaths()

# 1. 설치되어 있는 패키지 확인하기.
# installed.packages()를 실행하면 패키지가 설치되어 있는 위치를 알려준다.
installed.packages()

# 1. 패키지 정보 확인하기
# 
# library(help=패키지명)을 실행하면 패키지의 정보를 출력해 준다.
library(help="datasets")

# 패키지 설치하기
# install.packages(패키지명 문자열 벡터)를 실행하면 입력한 패키지를 설치한다. 
# 패키지가 단독으로 실행이 불가할 경우 필요한 패키지도 같이 설치한다.
install.packages(c("rpart", "survival"))

# 패키지 업데이트하기
# update.packages()를 실행하면 업데이트 가능한 모든 패키지를 업데이트하고,
# update.packages(“업데이트할 패키지명”)을 실행하면 지정한 패키지만 업데이트 한다.
update.packages(c("rpart", "survival"))
update.packages()

# 패키지 제거하기
# remove.packages(제거할 패키지명)을 실행하면 입력한 패키지를 설치한다.
remove.packages(c("rpart", "survival"))

# 패키지 사용하기
# 설치 후 R에서 해당 패키지를 사용하려면 library(패키지명) 을 수행해야지만 
# 해당 패키지의 기능을 사용할 수 있다.
library("ggplot2")

