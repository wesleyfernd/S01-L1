% fato: disciplina(nome, area, creditos).
% fato: prerequisito(disciplina, prereq).

alto_impacto(D) :-
    disciplina(D, _, C),
    C > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% query 1:
% ?- alto_impacto(D).

% query 2:
% disciplinas de matematica com 4 creditos que nao sao prerequisito de nenhuma outra
% ?- disciplina(D, matematica, 4), \+ prerequisito(_, D).