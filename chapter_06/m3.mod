module m3.
accumulate m1, m2.
type   s,t    item -> o.
type   b      item.
s X :- p X.
t b.
end

% ⋊> ~/K/programming-with-higher-order-logic on main ◦ cd ./chapter_06/; tjcc m3                                                                              05:40:34
% m2.sig(3,7) : Error : constant 'r' declared with incompatible type 'item -> o'
%         See constant declaration with type '(list item) -> o' at m1.sig(5,7)