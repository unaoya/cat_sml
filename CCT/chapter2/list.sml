exception empty_list

fun max(nil) = raise empty_list
    | max(x::xs) =
    let val m = max(xs) handle empty_list => x
    in if x > m then x else m end

fun sum(nil) = 0
    | sum(x::xs) = x + sum(xs)

fun poly_ev(nil, x) = 0
    | poly_ev(a::s, x) = a + x * poly_ev(s,x)

fun append(nil,x) = x
    | append(y::s,x) = y::append(s,x)

fun reverse(nil) = nil
    | reverse(x::s) = append(reverse(s),[x])

fun accum(nil,v) = v
    | accum(x::s,v) = x + accum(s,v)