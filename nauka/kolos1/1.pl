% Base case: an empty list does not contain X at least twice.
member2(_, []) :- false.

% Recursive case 1: if the head of the list is X, check if X appears at least once more in the rest of the list.
member2(X, [X | T]) :- member(X, T), !.

% Recursive case 2: if the head of the list is not X, continue searching in the tail.
member2(X, [_ | T]) :- member2(X, T).

% Helper predicate: member(X, L) is true if X is an element of list L.
member(X, [X | _]).
member(X, [_ | T]) :- member(X, T).


down(0,[0]).
down(N, [N|T]) :- N1 is N-1, down(N1,T).