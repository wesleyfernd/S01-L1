% onde cada deus habita
habita(zeus, olimpo).
habita(poseidon, olimpo).
habita(hades, submundo).

% dominios de cada deus
dominio(zeus, ceu).
dominio(zeus, relampagos).

dominio(poseidon, mar).
dominio(poseidon, terremotos).

dominio(hades, submundo).

deus_maior(Deus) :-
    habita(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.

% query
% ?- deus_maior(Deus).    