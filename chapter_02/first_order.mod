module first_order.
  type memb      A -> list A -> o.
  (memb 1 (2 :: 1 :: nil) :- memb 1 (1 :: nil)), memb 1 (1 :: nil).
  memb 1 (1 :: nil) => memb 1 (2 :: 1 :: nil) & memb 1 (1 :: nil).
  (memb 1 (1 :: nil) => memb 1 (2 :: 1 :: nil)) & memb 1 (1 :: nil).
  
  type append    list A -> list A -> list A -> o.
end