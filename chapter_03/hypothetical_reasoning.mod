module hypothetical_reasoning.
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
  
  fact (finished kim 102) & fact (finished dana 101).
  fact (finished kim 210) & fact (finished dana 250).
  
  fact (cs_major X) :-
    (fact (finished X 101); fact (finished X 102)),
    fact (finished X 210), fact (finished X 301).
  fact (graduates X) :-
    (fact (finished X 101); fact (finished X 102)),
    (fact (finished X 210); fact (finished X 250)),
    fact (finished X 301).
  
  false :- fact (finished X 210), fact (finished X 250).
  
  ex1 X   :- fact (finished dana X) => false.
  ex2 X Y :- fact (finished X Y) => (fact (graduates X) & fact (cs_major X)).
  ex3 X Y :- fact (finished kim X) => fact (finished kim Y)
               => (fact (graduates kim), fact (cs_major kim)).
  ex4     :- fact (finished kim 250) => fact (finished kim 301) => false.
end

% [hypothetical_reasoning] ?- ex1 X.

% The answer substitution:
% X = 210

% More solutions (y/n)? y

% no (more) solutions

% [hypothetical_reasoning] ?- ex2 X Y.

% The answer substitution:
% Y = 301
% X = kim

% More solutions (y/n)? y

% no (more) solutions

% [hypothetical_reasoning] ?- ex3 X Y.

% The answer substitution:
% Y = 101
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 101
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 101

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 101

% More solutions (y/n)? y

% The answer substitution:
% Y = 102
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 102
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 102

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 102

% More solutions (y/n)? y

% The answer substitution:
% Y = 210
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 210
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 210

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 210

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 101

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 102

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 210

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = X

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 101
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 102
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 210
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = Y
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 250
% X = 301

% More solutions (y/n)? y

% The answer substitution:
% Y = 301
% X = 250

% More solutions (y/n)? y

% no (more) solutions

% [hypothetical_reasoning] ?- ex4.

% yes

