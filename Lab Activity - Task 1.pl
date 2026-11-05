% Lab 10 - Task 1: Directed cities graph

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

travel(From, To, Path) :-
    path(From, To, [From], ReversedPath),
    reverse(ReversedPath, Path).

path(X, X, Visited, Visited).
path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).

% Example queries:
% ?- travel('Dammam', 'Madinah', P).
% ?- travel('Riyadh', 'Makkah', P).
% ?- travel('Makkah', 'Riyadh', P).
% ?- travel('Makkah', 'Madinah', P).
