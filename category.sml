use "sets.sml"

exception uncomposable
exception invalidArrow

datatype ('ob, 'ar)Category =
	 category of ('arrow -> 'obj) *	('arrow -> 'obj)
		     * ('obj -> 'arrow) * ('arrow * 'arrow -> 'arrow)

datatype 'a SetMap = setMap of ('a Set) * ('a -> 'a) * ('a Set)
fun setSource(setMap(a, f, b)) = a
fun setTarget(setMap(a, f, b)) = b
fun setIdentity(aSet) = setMap(aSet, (fn x => x), aSet)
fun setCompose(setmap(b', g, c), setmap(a, f, b)) =
    if setEq(b, b') then setMap(a, (g o f), c)
    else raise uncomposable

val FiniteSets = category(setSource, setTarget, setIdentity, setCompose)

datatype 'a PosetArrow = ltArrow of 'a * ('a -> 'a -> bool) * 'a

fun setPosetArrow(x)(y) = if subset(x)(y) then ltArrow(x, subset, y)
			  else raise invalidArrow

fun posetSource(ltArrow(x, f, y)) = x
fun posetTarget(ltArrow(x, f, y)) = y
fun posetIdentity(x) = ltArrow(x, (fn z => fn w => true), x)
fun posetCompose(ltArrow(b', g, c), ltArrow(a, f, b)) =
    if b = b' then ltArrow(a, (fn x => fn y => f(x)(b) andalso g(b)(y)), c)
    else raise uncomposable

val Posets = category(posetSource, posetTarget, posetIdentity, posetCompose)
	 
