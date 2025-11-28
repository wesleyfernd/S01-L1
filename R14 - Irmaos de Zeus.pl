pai_de(cronos, zeus).
mae_de(reia,   zeus).

pai_de(cronos, poseidon).
mae_de(reia,   poseidon).

pai_de(cronos, hades).
mae_de(reia,   hades).

irmaos_germanos(A, B) :-
    pai_de(Pai, A),
    pai_de(Pai, B),
    mae_de(Mae, A),
    mae_de(Mae, B),
    A \= B.

% query exemplo
% ?- irmaos_germanos(zeus, Irmao).