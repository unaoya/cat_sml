fun length nil = 0
    | length (x::s) = 1 + length s

fun append (nil,t) = t
    | append (x::s,t) = x::append(s,t)

fun list_member (x,nil) = false
    | list_member (x,y::s) = if x=y then true else list_member(x,s)

fun list_remove (x,nil) = nil
    | list_remove (x,y::s) = if x=y then s else list_remove(x,s)

abstype 'a Set = set of 'a list
	with val emptyset = set([])
	     fun is_empty(set(s)) = length(s)=0
	     fun singleton(x) = set([x])
	     fun union(set(s),set(t)) = set(append(s,t))
	     fun member(x,set(l)) = list_member(x,l)
	     fun remove(x,set(l)) = set(list_remove(x,l))
	     fun singleton_split(set(nil)) = raise empty_set
	     	 | singleton_split(set(x::s)) = (x,remove(x,set(s)))
	     fun split(s) = let val (x,s') = singleton_split(s) in (singleton(x),s') end
end
	    