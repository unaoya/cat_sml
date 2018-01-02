fun sign x = x > 0

fun absvalue x = if sign x then x else ~1 * x

fun max (x,y) = if sign (x-y) then x else y