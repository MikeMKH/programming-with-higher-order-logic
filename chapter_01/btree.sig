sig btree.

kind btree   type -> type.
type empty   btree A.
type node    A -> btree A -> btree A -> btree A.

kind term, form type.
type a, b       term.
type f          term -> term -> term.

type var        string -> term.

type p          term -> term -> form.
type q          term -> form.

type ff,
     tt   form.
type &&,
     !!,
     ==>   form -> form -> form.

type all        term -> form -> form.
type exists     term -> form -> form.
end