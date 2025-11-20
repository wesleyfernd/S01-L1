;;;; fauna-4546b.lisp
;;;; sistema simples de catalogo de criaturas do planeta 4546b


;; 1. definicao da estrutura criatura
;; campos: nome, ambiente, periculosidade, vida-media

(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)


;; 2. catalogo inicial com pelo menos 4 criaturas
;; - um peixe safe shallows (periculosidade baixa)
;; - um reaper leviathan (periculosidade alta)
;; - duas criaturas quaisquer com ambiente "Deep"

(defparameter *catalogo-fauna*
  (list
   ;; peixe safe shallows, perigo baixo
   (make-criatura
    :nome "peeper"
    :ambiente "Safe Shallows"
    :periculosidade "Baixa"
    :vida-media 5)

   ;; reaper leviathan, perigo alto
   (make-criatura
    :nome "Reaper Leviathan"
    :ambiente "Deep"
    :periculosidade "Alta"
    :vida-media 25)

   ;; criaturas deep adicionais
   (make-criatura
    :nome "Ghost Leviathan"
    :ambiente "Deep"
    :periculosidade "Alta"
    :vida-media 50)

   (make-criatura
    :nome "Crab Squid"
    :ambiente "Deep"
    :periculosidade "Media"
    :vida-media 15)))


;; 3. hof: filtro de perigo
;; funcao que retorna apenas criaturas cuja periculosidade nao seja "Baixa"

(defun filtra-por-perigo (catalogo)
  "Retorna uma lista com criaturas cuja periculosidade nao e baixa."
  (remove-if
   (lambda (cri)
     (string= (criatura-periculosidade cri) "Baixa"))
   catalogo))


;; 4. mapeamento de informacoes
;; funcao que retorna lista de strings no formato:
;; "[NOME]: vive em [AMBIENTE]"
;; mas apenas para criaturas do ambiente "Deep"
;; dica aplicada: usamos filtro antes de mapcar

(defun relatorio-profundidade (catalogo)
  "Retorna lista de strings com criaturas do ambiente deep."
  (let ((apenas-deep
          (remove-if-not
           (lambda (cri)
             (string= (criatura-ambiente cri) "Deep"))
           catalogo)))
    (mapcar
     (lambda (cri)
       (format nil "~A: vive em ~A"
               (criatura-nome cri)
               (criatura-ambiente cri)))
     apenas-deep)))


;; testes simples

(format t "teste 1 - catalogo completo~%")
(dolist (cri *catalogo-fauna*)
  (format t "criatura: ~A, ambiente: ~A, perigo: ~A, vida media: ~A~%"
          (criatura-nome cri)
          (criatura-ambiente cri)
          (criatura-periculosidade cri)
          (criatura-vida-media cri)))

(format t "~%teste 2 - filtra-por-perigo (remove perigo baixo)~%")
(let ((perigosas (filtra-por-perigo *catalogo-fauna*)))
  (dolist (cri perigosas)
    (format t "criatura perigosa: ~A (perigo: ~A)~%"
            (criatura-nome cri)
            (criatura-periculosidade cri))))

(format t "~%teste 3 - relatorio-profundidade (apenas deep)~%")
(dolist (linha (relatorio-profundidade *catalogo-fauna*))
  (format t "~A~%" linha))
