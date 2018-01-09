exception Foo of int

fun foo(n) = if n<0 then raise Foo(n) else 1

fun foo1(n) = foo(n) handle
	      Foo(~1) => (print "Foo error 1\n"; 0) |
	      Foo(~2) => (print "Foo error 2\n"; 0) |
	      Foo(_) => (print "Foo error 3\n"; 0)
