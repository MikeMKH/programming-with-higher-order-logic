sig btree.

type append           list A -> list A -> list A -> o.

kind btree            type -> type.
type empty            btree A.
type node             A -> btree A -> btree A -> btree A.

type insert           int -> btree int -> btree int -> o.

end