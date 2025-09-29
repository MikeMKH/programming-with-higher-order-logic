module smlists.

type id                list A -> list A -> o.
type memb, member      A -> list A -> o.
type revapp            list A -> list A -> list A -> o.
type reverse           list A -> list A -> o.
type append            list A -> list A -> list A -> o.
type memb_and_rest     A -> list A -> list A -> o.

id nil nil.
id (X::L) (X::K) :- id L K.

memb X (X::L).
memb X (Y::L) :- memb X L.

member X (X::L) :- !.
member X (Y::L) :- member X L.

revapp nil L L.
revapp (X::L1) L2 L3 :- revapp L1 (X::L2) L3.

reverse L1 L2 :- revapp L1 nil L2.

append nil K K.
append (X::L) K (X::M) :- append L K M.

memb_and_rest X (X::L) L.
memb_and_rest X (Y::K) (Y::L) :- memb_and_rest X K L.

end