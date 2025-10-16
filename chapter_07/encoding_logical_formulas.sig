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

kind   tm     type.
type   app    tm -> tm -> tm.
type   abs    (tm -> tm) -> tm.

type list_instan     list term -> form -> form -> o.

type interp      form -> form -> o.
type backchain   form -> form -> form -> o.
type atom        form -> o.

type a, b, c    term.
type adj, path  term -> term -> form.
type prog       form -> o.
end