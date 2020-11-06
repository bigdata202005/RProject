HR = read.csv('HR_comma_sep.csv')
# 문제1 : HR 데이터의 행의 수, 열의 수를 구하시오.
str(HR)
dim(HR)

# 문제2 : salary변수의 strings에 대해 답하시오.
str(HR$salary)

# 문제 3 : salary변수에 대하여 low는 1, medium은 2, high는 3의 값을 가져 
# 서열정보를 가지게 하는 salary_New 변수를 만드시오

salary_New = ifelse(HR$salary=='low', 1, ifelse(HR$salary=='medium',2,3))
salary_New
summary(salary_New)
salary_New = as.factor(salary_New)
summary(salary_New)


# 문제 4 : Salary_New 값이 2이면서 left는 1인 직원들만 뽑아 
# Medium_Left라는 새로운 데이터프레임을 만드시오.
HR$salary_New = ifelse(HR$salary=='low', 1, ifelse(HR$salary=='medium',2,3))
Medium_Left = subset(HR, HR$salary_New==2 & HR$left==1)
dim(Medium_Left)

