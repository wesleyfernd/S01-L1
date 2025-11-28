progenitor(urano, cronos).
progenitor(gaia,  cronos).

progenitor(cronos, zeus).
progenitor(cronos, poseidon).
progenitor(cronos, hades).

progenitor(zeus, ares).

ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).

% query
% ?- ancestral(urano, Descendente).