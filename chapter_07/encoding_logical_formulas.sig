sig encoding_logical_formulas.
kind term, form  type.
type    ff,                            % encoding the false proposition
        tt  form.                      % encoding the true proposition 
type    &&,                            % encoding conjunction
        !!,                            % encoding disjunction
        ==>   form -> form -> form.    % encoding implication
type    neg   form -> form.            % encoding negation

type   p   term -> form.
type   q   term -> term -> form.
type   f   term -> term.
type   a   term.

type  all, some      (term -> form) -> form.
end