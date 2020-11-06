source('my_functions.R')
my_sum(10)
my_sum(1000)

for(i in 1:10){
  print(sprintf("%10d, %10d", factorial(i), my_factorial(i)))
}

for(i in 1:10){
   cat(fibonacci(i), ' ')
}

for(i in 2000:2040){
  print(sprintf("%d : %s",i,(ifelse(is.leap_year(i), '윤년', '평년'))))
}

v1 = make_vector(1,2,3)
v1
is.vector(v1)

v2 = make_vector(x = 1,z = 2,y =3)
v2
is.vector(v2)

v3 = make_vector2(1,2,3)
v3
is.vector(v3)

v4 = make_vector2(1,2,3,4,5,6,7,8,9,10)
v4
is.vector(v4)


outer_fn(3)
outer_fn(5)


