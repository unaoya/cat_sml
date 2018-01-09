datatype Num = zero | succ of Num

fun even(zero) = true
  | even(succ(n)) = not(even(n))

fun add(zero,n) = n
  | add(succ(m),n) = succ(add(m,n))

fun numprint(zero)= 0
  | numprint(succ(n))= 1 + numprint(n)

fun mult(zero,n) = zero
  | mult(succ(m),n) = add(n,mult(m,n))
