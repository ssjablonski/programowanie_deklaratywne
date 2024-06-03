% loves(romeo, juliet). % to jest fakt


% odpowiedznik if 
% :-

% loves(juliet, romeo) :- loves(romeo, juliet).
% juliet loves romeo as long as romeo loves juliet

% jak wpiszemy teraz loves(romeo, X) to dostaniemy odpowiedź, że X = juliet i wtedy X jest naszą zmienna (ZMIENNE Z DUŻYCH LITER)

% male(albert).
% male(bob).
% male(bill).
% male(carl).
% male(charlie).
% male(dan).
% male(edward).

% female(alice).
% female(betsy).
% female(diana).

% happy(albert).
% happy(alice).
% happy(bob).
% happy(bill).
% with_albert(alice).

% runs(albert) :-
%     happy(albert).

% dances(alice) :-
%     happy(alice),
%     with_albert(alice).

% does_alice_dance :- dances(alice),
%     write('When Alice is happy and with Albert she dances').

% swims(bill) :-
%     happy(bill).

% swims(bill) :-
%     near_water(bill).

% mimo ze nie zdefiniowalismy near_water(bill) to wciaz bedzie to prawda, bo mamy dwa fakty, ktore mowia, ze bill plywa



% -----

% happy(albert).
% happy(alice).
% happy(bob).
% happy(bill).
% with_albert(alice).

% dances(alice) :-
%     happy(alice),
%     with_albert(alice).


% male(albert).
% male(bob).
% male(bill).
% male(carl).
% male(charlie).
% male(dan).
% male(edward).

% female(alice).
% female(betsy).
% female(diana).

% parent(albert, bob).
% parent(albert, betsy).
% parent(albert, bill).

% parent(alice, bob).
% parent(alice, betsy).
% parent(alice, bill).

% parent(bob, carl).
% parent(bob, charlie).

% get_grandchild :- 
%     parent(albert, X),
%     parent(X, Y),
%     write('Alberts grandchild is '),
%     write(Y), nl.

% get_grandparent :-
%     parent(X, carl),
%     parent(X, charlie),
%     % write('Carls and Charlies grandparent is '),
%     % write(X), nl.
%     format('~w ~s grandparent ~n', [X, 'is the']).
% ~w - zmienna w formacie tekstowym ~s - string ~n - nowa linia

% brother(bob, bill).

% grand_parent(X, Y) :-
%     parent(Z, X),
%     parent(Y, Z).

% i teraz mozemy np wywolec grand_parent(carl, X) i dostaniemy X = albert i X = alice


% blushes(X) :- human(X).
% human(derek).

% stabs(tybalt, mercutio, sword).
% hates(romeo, X) :- stabs(X, mercutio, sword).

% wtedy jak wpiszemy hates(romeo, X) to dostaniemy X = tybalt

% -----------------

% what_grade(5) :-
%     write('Go to kindergarten').

% what_grade(6) :-
%     write('Go to 1st grade').

% what_grade(Other) :-
%     Grade is Other - 5,
%     format('Go to grade ~w', [Grade]). % ~w - zmienna w formacie tekstowym

% ----------------- Structures


% has(albert, olive).

% owns(albert, pet(cat, olive)).

% customer(tom, smith, 20.55).
% customer(sally, smith, 120.55).
 
% % i teraz jak wpiszemy customer(tom, _, Y) to dostaniemy Y = 20.55 a _ zostanie pominięte

% get_cust_bal(FName, LName) :-
%     customer(FName, LName, Bal),
%     write(FName), tab(1),
%     format('~w owes us $~2f ~n', [LName, Bal]).

% vertical(line(point(X, Y), point(X, Y2))).

% horizontal(line(point(X, Y), point(X2, Y))).

% ------------ porownywanie

% =  equal
% \= - not equal
% > - greater than
% < - less than
% >= - greater or equal
% =< - less or equal

% rich(money, X) = rich(Y, no_debt).
% X = no_debt i Y = money

% -------------

% warm_blooded(penguin).
% warm_blooded(human).

% produce_milk(penguin).
% produce_milk(human).

% have_feathers(penguin).
% have_hair(human).

% mammal(X) :-
%     warm_blooded(X),
%     produce_milk(X),
%     have_hair(X).

% ---------------------- RECURSION

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie). 

related(X, Y) :-
    parent(X, Y).

related(X, Y) :-
    parent(X, Z),
    related(Z, Y).
% najpierw sprawdzamy czy X jest rodzicem Y, jak nie to sprawdzamy czy X jest rodzicem Z i czy Z jest rodzicem Y

% [trace] 6 ?- related(albert, carl).
%    Call: (12) related(albert, carl) ? creep
%    Call: (13) parent(albert, carl) ? creep
%    Fail: (13) parent(albert, carl) ? creep
%    Redo: (12) related(albert, carl) ? creep
%    Call: (13) parent(albert, _6702) ? creep
%    Exit: (13) parent(albert, bob) ? creep
%    Call: (13) related(bob, carl) ? creep
%    Call: (14) parent(bob, carl) ? creep
%    Exit: (14) parent(bob, carl) ? creep
%    Exit: (13) related(bob, carl) ? creep
%    Exit: (12) related(albert, carl) ? creep
% true .

% 5+5 = 2*5.  % false
% 5+5 =:= 2*5. % true

% is_even(X) :-
%     Y is mod(X,2),
%     Y =:= 0.

length(0, []).
length(N, [_|L]) :-
    length(M, L),
    N is M + 1.