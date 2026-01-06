module process_calc_lang.

kind name         type.
kind proc         type.

type null         proc.
type plus, par    proc -> proc -> proc.
type in           name -> (name -> proc) -> proc.
type out, match   name -> name -> proc -> proc.
type taup         proc -> proc.
type nu           (name -> proc) -> proc.
type bang         proc -> proc.

type a, b, c      name.
type example      int -> proc -> o.
example 1 (par (in b y\ null) (out b a null)).
example 2 (plus (in b y\ out b a null) (out b a (in b y\ null))).
example 3 (nu x\ par (in x y\ null) (out x a null)).
example 4 (nu x\ out a x null).
example 5 (in a y\ par  (in y w\ null) (out b b null)).
example 6 (in a y\ plus (in y w\ out b b null) (out b b (in y w\ null))).
example 7 (nu y\ out a y (par  (in y w\ null) (out b b null))).
example 8 (nu y\ out a y (plus (in y w\ out b b null) (out b b (in y w\ null)))).

end