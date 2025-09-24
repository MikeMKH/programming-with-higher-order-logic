sig difference_lists.
kind dlist type -> type.
type dl    list A -> list A -> dlist A.

type concat dlist A -> dlist A -> dlist A -> o.

kind btree type -> type.
type empty btree A.
type bt    A -> btree A -> btree A -> btree A.

type collect btree A -> list A -> o.
type aux     btree A -> dlist A -> o.

kind fdlist type -> type.
type fdl    (list A -> list A) -> fdlist A.

type collect' btree A -> list A -> o.
type aux'     btree A -> fdlist A -> o.

type palindrome fdlist A -> o.
end