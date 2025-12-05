% disciplina(nome, area).
% prerequisito(disciplina, prereq).
% concluiu(aluno, disciplina).

falta_concluir(aluno, disc) :-
    prerequisito(disc_mat, disc),
    \+ concluiu(aluno, disc_mat).

aluno_apto(aluno, disc) :-
    disciplina(disc, area),
    area \= fundamental,
    \+ falta_concluir(aluno, disc).

% querys:
% ?- aluno_apto(joao, D).
% ?- aluno_apto(maria, inteligencia_artificial).