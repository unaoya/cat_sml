exception empty_list

fun max(nil) = raise empty_list
    | max(x::xs) = if x > max(xs) then x else max(xs) handle empty_list => x