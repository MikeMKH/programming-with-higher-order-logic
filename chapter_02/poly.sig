sig poly.

kind lst            type.
type null           lst.
type cons           A -> lst -> lst.
type separate       lst -> list int -> list real -> o.

kind numb           type.
type inj_int        int -> numb.
type inj_real       real -> numb.
type separate'      list numb -> list int -> list real -> o.

end