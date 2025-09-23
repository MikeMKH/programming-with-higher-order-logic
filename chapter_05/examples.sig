sig examples.
type foreach, forsome (A -> o) -> list A -> o.
type mappred          (A -> B -> o) -> list A -> list B -> o.
type sublist          (A -> o) -> list A -> list A -> o.

kind name                    type.
type bob, sue, ned, jay      name.
type age                     name -> int -> o.
type male, female, nonbinary name -> o.

type ref, sym, trans (A -> A -> o) -> A -> A -> o.

kind node type.
type a, b, c, d, e node.
type adj           node -> node -> o.

type union   (A -> B -> o) -> (A -> B -> o) -> A -> B -> o.
type compose (A -> B -> o) -> (B -> C -> o) -> A -> C -> o.
type foldl   (A -> B -> B -> o) -> list A -> B -> B -> o.

kind stack         type -> type.
type emp           stack A.
type stk           A -> stack A -> stack A.
type empty         stack A -> o.
type enter, remove A -> stack A -> stack A -> o.
type reverse       list A -> list A -> o.

kind i                             type.
type jane, mary, john              i.
type mother, father, wife, husband i -> i -> o.
type primrel, rel                  (i -> i -> o) -> o.

type tt, ff o.
type or     o -> o -> o.
type exists (A -> o) -> o.

type if    o -> o -> o -> o.
type not'  o -> o.
type not'' o -> o.

kind i              type.
type a1, b1, c1, d1 i.
type g1             i -> i -> i.

type mapfun    (A -> B) -> list A -> list B -> o.
type reducefun (A -> B -> B) -> list A -> B -> B -> o.
end