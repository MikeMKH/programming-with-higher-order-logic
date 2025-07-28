sig hypothetical_reasoning.
kind entry                  type.
type fact                   entry -> o.
type false                  o.

kind person                 type.
type kim, dana              person.
type finished               person -> int -> entry.
type cs_major, graduates    person -> entry.

type ex1                    int -> o.
type ex2                    person -> int -> o.
type ex3                    int -> int -> o.
type ex4                    o.
end