module lists.

  type append   list A -> list A -> list A -> o.
  append nil L L.
  append (X::L) K (X::M) :- append L K M.

  type rev_aux  list A -> list A -> list A -> o.
  rev_aux nil L L.
  rev_aux (X::L1) L2 L3 :- rev_aux L1 (X::L2) L3.

  type reverse  list A -> list A -> o.
  reverse L1 L2 :- rev_aux L1 nil L2.

  type member   A -> list A -> o.
  member X (X::L).
  member X (Y::L) :- member X L.

end
