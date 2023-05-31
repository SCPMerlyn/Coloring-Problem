color(red).
color(blue).
color(yellow).
color(green).

different(X, Y):- 
    color(X), 
    color(Y), 
    X\=Y.

coloring(M, G):- 
    complete(M, G), 
    consistent(M, G),
    write(M), nl.

complete([], [[], []]).
complete([paint(X, _)|T], [[X|T1], [_|T2]]):-
    complete(T, [T1, T2]).

consistent(_, [[], []]).
consistent(M, [[X|T1], [[Y|T2]|T]]):- 
    assign(M, X, Xc), 
    assign(M, Y, Yc), 
    different(Xc, Yc),
    consistent(M, [[X|T1], [T2|T]]).
consistent(M, [[_|T], [[]|R]]):- 
    consistent(M, [T, R]).

assign([paint(X, Xc)|_], X, Xc).
assign([_|R], X, Xc):- 
    assign(R, X, Xc).
