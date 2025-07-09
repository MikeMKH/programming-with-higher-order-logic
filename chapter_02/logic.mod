module logic.

  kind term, form     type.
  type tt, ff         form.
  type &&, !!, ==>    form -> form -> form.
  infixl &&           5.
  infixl !!           4.
  infixr ==>          3.
  type a, b           term.
  type f              term -> term -> term.
  type p, q           term -> term -> form.
  
  type memb_and_rest  A -> list A -> list A -> o.
  memb_and_rest X (X::L) L.
  memb_and_rest X (Y::L) (Y::L1) :- memb_and_rest X L L1.
  
  type prv            list form -> list form -> o.
  prv Gamma Delta :- memb_and_rest ff Gamma _.
  prv Gamma Delta :- memb_and_rest (p X Y) Gamma _,
                     memb_and_rest (q X Y) Delta _.
  prv Gamma Delta :-
    memb_and_rest (A && B) Gamma Gamma',
    prv (A :: B :: Gamma') Delta.
  prv Gamma Delta :-
    memb_and_rest (A !! B) Gamma Gamma',
    prv (A :: Gamma') Delta,
    prv (B :: Gamma') Delta.
  prv Gamma Delta :-
    memb_and_rest (A ==> B) Gamma Gamma',
    prv Gamma (A :: Delta),
    prv (B :: Gamma') Delta.
  prv Gamma Delta :-
    memb_and_rest (A && B) Delta Delta',
    prv Gamma (A :: Delta'),
    prv Gamma (B :: Delta').
  prv Gamma Delta :-
    memb_and_rest (A !! B) Delta Delta',
    prv Gamma (A :: B :: Delta').
  prv Gamma Delta :-
    memb_and_rest (A ==> B) Delta Delta',
    prv (A :: Delta) (B :: Gamma').
    
end

% [logic] ?- prv nil (((p a b) !! ((p a b) ==> (q a b))) :: nil).

% yes