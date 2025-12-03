module deduction_propositional_intuitionistic_logic.
kind   term, form  type.

type    ff,                            % encoding the false proposition
        tt    form.                    % encoding the true proposition 
type    &&,                            % encoding conjunction
        !!,                            % encoding disjunction
        ==>   form -> form -> form.    % encoding implication

infixl  &&  5.        
infixl  !!  4.       
infixr  ==> 3.

type a, b, c   form.
type  atom     form -> o.
type  seq      list form -> form -> o.

atom a & atom b & atom c.

type example1 o.
example1 :-
  pi a\ pi b\ pi c\ atom a => atom b => atom c => seq nil (a ==> (a ==> b) ==> (a ==> b ==> c) ==> c).

type memb_and_rest     A -> list A -> list A -> o.

memb_and_rest X (X::L) L.
memb_and_rest X (Y::K) (Y::L) :- memb_and_rest X K L.

seq Gamma A :- atom A, memb_and_rest A Gamma _.
seq Gamma tt.
seq Gamma (A && B)  :- seq Gamma A, seq Gamma B.
seq Gamma (A !! B)  & 
seq Gamma (B !! A)  :- seq Gamma A.
seq Gamma (A ==> B) :- seq (A::Gamma) B.
seq Gamma _ :- memb_and_rest ff Gamma _.
seq Gamma G :- memb_and_rest (A && B) Gamma Gamma', seq (A::B::Gamma') G.
seq Gamma G :- memb_and_rest (A !! B) Gamma Gamma', 
               (seq (A::Gamma') G ; seq (B::Gamma') G).
seq Gamma G :- memb_and_rest (A ==> B) Gamma Gamma', 
  ( atom A, memb_and_rest A Gamma' _, seq (B::Gamma') G ;
    A = (C && D),  seq ((C ==> D ==> B) :: Gamma') G ;
    A = (C !! D),  seq ((C ==> B) :: (D ==> B) :: Gamma') G ;
    A = (C ==> D), seq ((D ==> B) :: Gamma') A, seq (B :: Gamma') G ;
    A = ff,        seq Gamma' G;
    A = tt,        seq (B :: Gamma') G  ).

type  all, some      (term -> form) -> form.

kind  proof          type.

type true_i          proof.
type false_e         form  -> proof -> proof.
type and_i           proof -> proof -> proof.
type and_e1, and_e2  form  -> proof -> proof.
type imp_i           (proof -> proof) -> proof.
type imp_e           form -> proof -> proof -> proof.
type or_i1, or_i2    proof -> proof.
type or_e            form  -> form -> proof -> 
                     (proof -> proof) -> (proof -> proof) -> proof.
type all_e           term  -> (term -> form) -> proof -> proof.
type all_i           (term -> proof) -> proof.
type some_e          (term -> form) -> proof -> 
                     (term -> proof -> proof) -> proof.
type some_i          term  -> proof -> proof.

type  #              proof -> form -> o.
infix # 2.

true_i # tt.
(and_i P1 P2) # (A && B) :- (P1 # A), (P2 # B).
(or_i1 P) # (A !! B)     :- P # A.
(or_i2 P) # (A !! B)     :- P # B.
(imp_i Q) # (A ==> B)    :- pi p\ (p # A) => ((Q p) # B).
(some_i T P) # (some A)  :- P # (A T).
(all_i Q) # (all A)      :- pi y\ (Q y) # (A y).
(false_e A P) # A        :- P # ff.
(and_e1 B P) # A         :- P # (A && B).
(and_e2 A P) # B         :- P # (A && B).
(or_e A B P Q1 Q2) # C   :- (P # (A !! B)),
                            (pi p1\ (p1 # A) => ((Q1 p1) # C)),
                            (pi p2\ (p2 # B) => ((Q2 p2) # C)).
(imp_e A P1 P2) # B   :- (P1 # A), (P2 # (A ==> B)).
(some_e A P1 Q) # B   :- (P1 # (some A)),
                         pi y\ pi p\ (p # (A y)) => ((Q y p) # B).
(all_e T A P) # (A T) :- (P # (all A)).

type a', b'    form.          % propositional constants
type q         term -> form.  % a predicate of one argument
type c'        term.          % a first-order constant
type f         term -> term.  % a term constructor

type example2_1 o.
example2_1 :- (imp_i w\w) # (a' ==> a').

type example2_2 o.
example2_2 :- (imp_i x\ imp_i y\ imp_e a' x y) # (a' ==> ((a' ==> b') ==> b')).

type example2_3 o.
example2_3 :- (imp_i P\ all_i y\ imp_i Q\ 
     (imp_e (q (f y)) 
         (imp_e (q y) Q (all_e y (x\ (q x) ==> (q (f x))) P)) 
         (all_e (f y) (x\ (q x) ==> (q (f x))) P))) 
    # ((all x\ (q x) ==> (q (f x))) ==> 
       (all x\ (q x) ==> (q (f (f x))))).

end

% [deduction_propositional_intuitionistic_logic] ?- example1.

% no (more) solutions

% [deduction_propositional_intuitionistic_logic] ?- example2_1.

% yes

% [deduction_propositional_intuitionistic_logic] ?- example2_2.

% yes

% [deduction_propositional_intuitionistic_logic] ?- example2_3.

% yes

% [deduction_propositional_intuitionistic_logic] ?- (imp_i w\ (and_i (and_e2 a' w) (and_e1 b' w))) # R.

% The answer substitution:
% R = a' && b' ==> b' && a'

% More solutions (y/n)? y

% no (more) solutions