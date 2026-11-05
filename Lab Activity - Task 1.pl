% Facts

edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').

edge('Riyadh', 'Dammam').

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').


% Rules

travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

path(X, X, P, P).

path(From, To, Visited, Path) :-
    edge(From, X),
    not(member(X, Visited)),
    path(X, To, [X|Visited], Path).


% Example queries:
% ?- travel('Dammam', 'Madinah', P).
% ?- travel('Riyadh', 'Makkah', P).
% ?- travel('Makkah', 'Riyadh', P).
% ?- travel('Makkah', 'Madinah', P).
