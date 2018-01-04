datatype 'a BinTree =
	 tip of 'a | node of ('a BinTree)*('a BinTree)

fun breadth (tip x) = 1
    | breadth (node (x,y)) = breadth(x) + breadth(y)

fun max (x,y) = if x > y then x else y

fun append (nil, y) = y
    | append (x::s, y) = x::append(s,y)

fun depth (tip x) = 1
    | depth (node (x,y)) = max((depth x), (depth y)) + 1

fun tiplist (tip x) = [x]
    | tiplist (node (x,y)) = append((tiplist x), (tiplist y))
