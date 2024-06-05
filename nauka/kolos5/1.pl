% reverse(L1,L2) if fulfilled if L2 is L1 i reversed order
reverse([], []).
reverse([H|T], L2) :- reverse(T, ReverseT), append(ReverseT, [H], L2).

% reverse([1,2,3,4],L).
% L = [4,3,2,1]