sig fsm1.

type append             list A -> list A -> list A -> o.
type lists              list A -> o.

kind state, letter      type.
type q1, q2, q3, q4, q5 state.
type a, b               letter.
type start, final       state -> o.
type path, trans        state -> list letter -> state -> o.
type accept             list letter -> o.

end