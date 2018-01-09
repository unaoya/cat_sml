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

fun delete(x,nil) = nil
  | delete(x,a::s) =
    if x=a then delete(x,s)
    else a::delete(x,s)

fun deleten(x,n,nil) = nil
  | deleten(x,1,a::s) =
    if x=a then s
    else a::deleten(x,1,s)
  | deleten(x,n,a::s) =
    if x=a then a::deleten(x,n-1,s)
    else a::deleten(x,n,s)

fun member(x,nil) = false
  | member(x,a::s) =
    if x=a then true
    else member(x,s)
     
fun sublist(nil,t) = true
  | sublist(a::s,t) =
    if member(a,t) then sublist(s,t)
    else false

fun number_of_sublists(nil,t) = 1
  | number_of_sublists(a::s,nil) = 0
  | number_of_sublists(a::s,b::t) =
    if a=b then number_of_sublists(s,t) + number_of_sublists(a::s,t)
    else number_of_sublists(a::s,t)

(*
number_of_sublists([1,2],[2,1]);
> 0 : int
*)
