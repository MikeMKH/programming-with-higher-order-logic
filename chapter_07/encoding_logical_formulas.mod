module encoding_logical_formulas.
kind term, form  type.
type    ff,                            % encoding the false proposition
        tt  form.                      % encoding the true proposition 
type    &&,                            % encoding conjunction
        !!,                            % encoding disjunction
        ==>   form -> form -> form.    % encoding implication
type    neg   form -> form.            % encoding negation
infixl  &&  5.        
infixl  !!  4.       
infixr  ==> 3.

type   p   term -> form.
type   q   term -> term -> form.
type   f   term -> term.
type   a   term.

type  all, some      (term -> form) -> form.

kind   tm     type.
type   app    tm -> tm -> tm.
type   abs    (tm -> tm) -> tm.
end