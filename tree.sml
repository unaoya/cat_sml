datatype 'a Tree = empty
	| leaf of 'a
	| node of (('a Tree) * 'a * ('a Tree))
val t2 = node(node(leaf(2), 3, leaf(4)), 6, leaf(8))
fun breadth(empty) = 0
	| breadth(leaf(_)) = 1
	| breadth(node(left, _, right)) = breadth(left) + breadth(right)
fun depth(empty) = 0
	| depth(leaf(_)) = 1
	| depth(node(left, _, right)) =
		let
			val (lDepth, rDepth) = (1 + depth(left), 1 + depth(right))
		in
			if lDepth > rDepth then lDepth else rDepth
		end
fun flatten(empty) =[]
	| flatten(leaf(x)) = [x]
	| flatten(node(left, x, right)) = flatten(left) @ (x :: flatten(right))
fun insert(x, empty) = leaf(x)
	| insert (y, leaf(x)) = if x <= y
		then node(empty, x, leaf(y))
		else node(leaf(y), x, empty)
	| insert node(left, x, right)) = if x <= y
		then node(left, x, insert(y, right))
		else node(insert(y, left), x, right)
fun sort(L) = flatten(foldl(insert)(empty)(L))
