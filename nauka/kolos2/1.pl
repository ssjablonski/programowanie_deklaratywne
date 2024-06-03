% shift(L1,L2)jest spelniony jezeli lista l2 rowna sie l1 
% po jednej rotacji do lewej.
shift([],[]).
shift([M|T], L2) :- append(T,[M],L2).

% shift([1,2,3,4,5],L)
% L = [2,3,4,5,1]

% sil(N,L) ktory jest spelniony jeszeli L jest listą wartosci 
% N! od N do 0
silnia(0, 1).
silnia(N, A) :- N > 0, N1 is N-1, silnia(N1, A1), A is N*A1.

sil(0, [1]).
sil(N, [H|T]) :- N > 0, silnia(N, H), N1 is N-1, sil(N1, T).

% sil(4,L).
% [24,6,2,1,1]