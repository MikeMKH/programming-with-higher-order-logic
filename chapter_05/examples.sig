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
end