fun listMonoidLift(f:('a -> 'b), (combine:(('b * 'b) -> 'b), id:'b)) = 
	let
		fun f'(nil) = id
			| f'(head::tail) = combine(f(head), f'(tail))
	in
		f'
	end
fun plus(x, y) = x + y
val sum = listMonoidLift((fn x => x), (plus, 0))
val length = listMonoidLift((fn x => 1), (plus, 0))
fun member(x) = listMonoidLift((fn y => y = x), ((fn (a,b) => a orelse b), false))
fun map(f) = listMonoidLift((fn x => [f(x)]), ((fn (X, Y) => X @ Y), [])) 
