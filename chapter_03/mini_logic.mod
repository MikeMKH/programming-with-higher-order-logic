module mini_logic.
  type s o.
  type r o.
  type q o.
  type t o.
  type u o.
  
  s :- r, q.
  t :- q, u.
  q :- r.
  
  t :- r, u.
  s :- r.
  r => s.
  (r => u) => (r => t).
end