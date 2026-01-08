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

kind action       type.
type tau          action.
type up, dn       name -> name -> action.

type one          proc ->          action ->           proc  -> o.
type onep         proc -> (name -> action) -> (name -> proc) -> o.

kind trace        type.
type empty        trace.
type tr           action -> trace -> trace.  
type trp          (name -> action) -> (name -> trace) -> trace.  
type trace        proc -> trace -> o.

end