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
end

% [deduction_propositional_intuitionistic_logic] ?- example1.

% no (more) solutions