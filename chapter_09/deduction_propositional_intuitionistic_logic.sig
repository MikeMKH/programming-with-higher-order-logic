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

end