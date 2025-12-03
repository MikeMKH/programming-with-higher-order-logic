sig deduction_propositional_intuitionistic_logic.
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

type example1 o.

type memb_and_rest     A -> list A -> list A -> o.

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

type a', b'    form.          % propositional constants
type q         term -> form.  % a predicate of one argument
type c'        term.          % a first-order constant
type f         term -> term.  % a term constructor

type example2_1 o.
type example2_2 o.
type example2_3 o.

end