## 데이터 프레임 생성
cust_id = c("c01","c02","c03","c04")
last_name = c("Kim", "Lee", "Choi", "Park")
cust_mart_1 = data.frame(cust_id, last_name)
cust_mart_1
cust_mart_2 = data.frame(cust_id = c("c05", "c06", "c07"), 
                         last_name = c("Bae", "Kim", "Lim"))
cust_mart_2
# (1) 행 결합 (위 + 아래) rbind(A, B) 
cust_mart_12 = rbind(cust_mart_1, cust_mart_2) 
cust_mart_12


# 위의 행 결합 rbind()를 하기 위해서는 
# 결합하려는 두개의 데이터 셋의 열의 갯수와 속성, 이름이 같아야만 합니다. 
cust_mart_3 = data.frame(cust_id = c("c08", "c09"),
                          last_name = c("Lee", "Park"), 
                          gender = c("F", "M"))
cust_mart_3
cust_mart_13 = rbind(cust_mart_1, cust_mart_3) 
# Error in rbind(deparse.level, ...) : 
#   numbers of columns of arguments do not match

cust_mart_4 = data.frame(cust_id = c("c10", "c11"), 
                          first_name = c("Kildong", "Yongpal"))
cust_mart_4
cust_mart_14 = rbind(cust_mart_1, cust_mart_4) 
# Error in match.names(clabs, names(xi)) : 
#   names do not match previous names

# (2) 열 결합 (왼쪽 + 오른쪽) : cbind(A, B)
cust_mart_5 = data.frame(age = c(20, 25, 19, 40, 32, 39, 28), 
                          income = c(2500, 2700, 0, 7000, 3400, 3600, 2900))
cust_mart_12
cust_mart_5
cust_mart_125 = cbind(cust_mart_12, cust_mart_5)
cust_mart_125

# cbind()도 열 결합을 하려고 하면 서로 결합하려는 
# 두 데이터셋의 관측치가 행이 서로 동일 대상이어야만 하고, 
# 행의 갯수가 서로 같아야만 합니다. 
cust_mart_6 = data.frame(age = c(34, 50),income = c(3600, 5100))
cust_mart_6
cust_mart_126 = cbind(cust_mart_12, cust_mart_6)
# Error in data.frame(..., check.names = FALSE) : 
#   arguments imply differing number of rows: 7, 2


# (3) 동일 key 값 기준 결합 : merge(A, B, by='key)
# 두개의 데이터셋을 열 결합할 때 동일 key 값을 기준으로 결합을 해야 할 때가 있습니다.  
# cbind()의 경우 각 행의 관찰치가 서로 동일 대상일 때 그리고 갯수가 같을 때 가능하다고 했는데요, 
# 만약 각 행의 관찰치가 서로 동일한 것도 있고 그렇지 않은 것도 섞여 있다면 그때는 cbind()를 사용하면
# 안됩니다.  이때는 동일 key 값을 기준으로 결합을 해주는 merge(A, B, by='key')를 사용해야만 합니다.
cust_mart_7 = data.frame(cust_id = c("c03", "c04", "c05", "c06", "c07", "c08", "c09"),
                          buy_cnt = c(3, 1, 0, 7, 3, 4, 1))
cust_mart_12
cust_mart_7
cust_mart_127 = cbind(cust_mart_12, cust_mart_7)
cust_mart_127

# cust_mart_12 와 cust_mart_7 의 두 개의 데이터 프레임의 
# 관측치가 서로 같은 것(cust_id 가 c03 ~ c07)도 있는 반면, 
# 서로 다른 것(cust_id 가 c01~c02, c08~c09)도 있습니다.  
# 이런 데이터 셋을 cbind()로 결합시켜버리면 엉뚱한 데이터 셋이 생성되어 버립니다. Oh no~!!!!!
# 이런 경우에는 동일한 key 값을 기준으로 결합을 시켜주는 merge(A, B, by='key')가 답입니다.
# SQL에 익숙한 분들은 잘 아시겠지만, merge에는 기준을 어느쪽에 두고 어디까지 포함하느냐에 따라 
# Inner Join, Outer Join, Left Outer Join, Right Outer Join 등의 4가지 종류가 있습니다.

# (3-1) merge() : Inner Join 
cust_mart_127_innerjoin = merge(x = cust_mart_12, y = cust_mart_7, by = 'cust_id')
cust_mart_127_innerjoin
# (3-2) merge() - Outer Join
cust_mart_127_outerjoin = merge(x = cust_mart_12, y = cust_mart_7, by = 'cust_id', all = TRUE)
cust_mart_127_outerjoin

# (3-3) merge() : Left Outer Join
cust_mart_127_leftouter <- merge(x = cust_mart_12, y = cust_mart_7, by = 'cust_id', all.x = TRUE)
cust_mart_127_leftouter
# (3-4) merge() : Right Outer Join
cust_mart_127_rightouter <- merge(x = cust_mart_12, y = cust_mart_7, by = 'cust_id', all.y = TRUE)
cust_mart_127_rightouter

merge(cust_mart_12, cust_mart_5, cust_mart_7, by = 'cust_id')
# Error in fix.by(by.x, x) : 
#   'by' must specify one or more columns as numbers, names or logical
