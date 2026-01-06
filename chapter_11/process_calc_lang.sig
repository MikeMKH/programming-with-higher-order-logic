sig process_calc_lang.

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

end