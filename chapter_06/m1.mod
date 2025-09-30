module m1.
kind   item   type.
type   p,q    item -> o.
type   a      item.
type   r      list item -> o.
p X :- q X.
r (a::nil).
end