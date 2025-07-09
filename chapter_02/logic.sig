sig logic.

kind term, form     type.
type tt, ff         form.
type &&, !!, ==>    form -> form -> form.
infixl &&           5.
infixl !!           4.
infixr ==>          3.
type a, b           term.
type f              term -> term -> term.
type p, q           term -> term -> form.

type memb_and_rest  A -> list A -> list A -> o.
type prv            list form -> list form -> o.

end