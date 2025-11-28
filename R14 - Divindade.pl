filho_de(zeus, cronos).
filho_de(zeus, reia).

filho_de(poseidon, cronos).
filho_de(poseidon, reia).

filho_de(hades, cronos).
filho_de(hades, reia).

% dominios das divindades
dominio(zeus, ceu).
dominio(poseidon, mar).
dominio(hades, submundo).

divindade_olimpica(Deus) :-
    filho_de(Deus, cronos),
    dominio(Deus, Dominio),
    ( Dominio = ceu
    ; Dominio = mar
    ; Dominio = submundo
    ).

% query
% ?- divindade_olimpica(Deus).    