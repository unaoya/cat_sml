exception empty_list: unit

fun head(nil) = raise empty_list
    | head(a::s) = a

fun append(s,t) =
    head(s)::append(tail(s),t) handle empty_list => t