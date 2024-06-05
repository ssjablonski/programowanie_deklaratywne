% twice(L1,L2) jezeli lista L2 zawiera
% wszystkie elem L1 podwojnie
twice([],[]).
twice([H|T], [H,H|T2]) :- twice(T, T2).

% twice([a,b,c], L).
% L = [a, a, b, b, c, c].


% postorder(drzewo(4, drzewo(3, 
% drzewo(8,nil,nil),nil),drzewo(2,nil,drzewo(7,nil,nil))),L).
% L = [8, 3, 7, 2, 4].

postorder(nil, []).
postorder(drzewo(X, L, P), W) :-
    postorder(L, LL),
    postorder(P, PP),
    append(LL, PP, Temp),
    append(Temp, [X], W).


preorder(nil, []).
preorder(drzewo(X, L, P), [X|L2]) :-
    preorder(L, L1),
    preorder(P, P1),
    append(L1, P1, L2).


inorder(nil, []).
inorder(drzewo(X, L, P), L2) :-
    inorder(L, L1),
    inorder(P, P1),
    append(L1, [X|P1], L2).


