module simplang.
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
  infixl &&, mult        5.
  infixl !!, plus, minus 4.
  infixl lt              3.
  infixl !=              2.
end