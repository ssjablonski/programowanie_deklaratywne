% member(X,L) jest spelniopny jak x jest elem list l

member(X, [X|_]).
member(X, [_|L]) :- member(X,L).

% member(2, [1,2,3,4,5]).

% split(X,L,L1,L2) jest spelniont jak L1 zawiera wszystkie elem L mniejsze od X
% a L2 zawiera wszystkie elem wieksze od X

split(_, [], [], []).
split(X, [H|T], [H|L1], L2) :- X < H, split(X, T, L1, L2).
split(X, [H|T], L1, [H|L2]) :- X > H, split(X, T, L1, L2).
split(X, [X|T], L1, L2) :- split(X, T, L1, L2).

% split(5,[2,7,4,8,-1,5],L1,L2).
% L1 = [7, 8],
% L2 = [2, 4, -1] 


