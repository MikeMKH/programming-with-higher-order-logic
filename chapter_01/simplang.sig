sig simplang.
kind stmt, expr   type.
type id           string -> expr.
type c            int -> expr.
type t,f          expr.
type &&, !!,
     plus, minus,
     mult, lt     expr -> expr -> expr.
type !=           expr -> expr -> stmt.
type cond         expr -> stmt -> stmt -> stmt.
type while        expr -> stmt -> stmt.
type seq          stmt -> stmt -> stmt.
end