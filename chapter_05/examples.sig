sig examples.
type foreach, forsome (A -> o) -> list A -> o.
type mappred          (A -> B -> o) -> list A -> list B -> o.
type sublist          (A -> o) -> list A -> list A -> o.

kind name                    type.
type bob, sue, ned, jay      name.
type age                     name -> int -> o.
type male, female, nonbinary name -> o.
end