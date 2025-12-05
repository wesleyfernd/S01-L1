% disciplina(nome, area).
% concluiu(aluno, disciplina).

especialista_comp(A) :-
    concluiu(A, D1),
    concluiu(A, D2),
    D1 \= D2,
    disciplina(D1, computacao),
    disciplina(D2, computacao).

deficiencia_mat(A) :-
    \+ (concluiu(A, D), disciplina(D, matematica)).

% query:
% ?- especialista_comp(A), deficiencia_mat(A).
