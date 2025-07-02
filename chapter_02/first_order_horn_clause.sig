sig first_order_horn_clause.

type append list A -> list A -> list A -> o.
type sublist list A -> list A -> o.

kind bool type.
type neg bool -> bool.
type and, or, imp bool -> bool -> bool.
type ident bool -> bool -> o.

end