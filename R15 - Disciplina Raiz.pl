% disciplina(nome, area).
% prerequisito(disciplina, prereq).

disciplina_raiz(D) :-
    disciplina(D, _),
    \+ prerequisito(_, D).

disciplina_folha(D) :-
    disciplina(D, _),
    \+ prerequisito(D, _).

% query:
% disciplinas raiz que nao sao da area aplicacoes
% ?- disciplina_raiz(D), disciplina(D, A), A \= aplicacoes.
