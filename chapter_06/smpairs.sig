sig smpairs.

kind pair    type -> type -> type.
type pr      A -> B -> pair A B.

type assoc, assod   A -> B -> list (pair A B) -> o.
type domain         list (pair A B) -> list A -> o.
type range          list (pair A B) -> list B -> o.

end