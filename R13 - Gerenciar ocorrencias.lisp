;;;; exposicao-paranormal.lisp
;;;; sistema de analise de nivel de exposicao paranormal


;; 1. estrutura ocorrencia
;; campos: nome, ritual, nivel-medo, agentes-enviados

(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)


;; 2. funcao recursiva: soma-medo-recursiva
;; recebe uma lista de ocorrencias e soma o campo nivel-medo

(defun soma-medo-recursiva (lista-ocorrencias)
  "retorna a soma total do campo nivel-medo em uma lista de ocorrencias."
  (if (null lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
         (soma-medo-recursiva (cdr lista-ocorrencias)))))


;; 3. funcao de alto nivel: analise-final
;; a) calcula media usando soma-medo-recursiva e length
;; b) filtra ocorrencias criticas:
;;    mais de 3 agentes-enviados e nivel-medo acima da media
;; c) retorna apenas a lista com nomes das ocorrencias criticas

(defun analise-final (lista-ocorrencias)
  "retorna lista com nomes das ocorrencias criticas."
  (let* ((total-medo (soma-medo-recursiva lista-ocorrencias))
         (quantidade (length lista-ocorrencias))
         ;; evita divisao por zero se lista vazia
         (media-medo (if (> quantidade 0)
                         (/ total-medo quantidade)
                         0))
         ;; filtra ocorrencias criticas
         (ocorrencias-criticas
          (remove-if-not
           (lambda (oc)
             (and (> (ocorrencia-agentes-enviados oc) 3)
                  (> (ocorrencia-nivel-medo oc) media-medo)))
           lista-ocorrencias)))
    ;; retorna apenas a lista de nomes das criticas
    (mapcar #'ocorrencia-nome ocorrencias-criticas)))


;; teste final: criar lista com 5 ocorrencias e chamar analise-final

(defparameter *lista-ocorrencias-teste*
  (list
   (make-ocorrencia
    :nome "vigilia em ravena"
    :ritual "invocacao de ecos"
    :nivel-medo 40
    :agentes-enviados 2)

   (make-ocorrencia
    :nome "caso da casa sangrando"
    :ritual "purificacao reversa"
    :nivel-medo 85
    :agentes-enviados 4)

   (make-ocorrencia
    :nome "porto dos sussurros"
    :ritual "selamento de nevoa"
    :nivel-medo 60
    :agentes-enviados 5)

   (make-ocorrencia
    :nome "monasterio das vozes frias"
    :ritual "exorcismo coral"
    :nivel-medo 90
    :agentes-enviados 3)

   (make-ocorrencia
    :nome "tunel espelhado"
    :ritual "quebra de reflexo"
    :nivel-medo 70
    :agentes-enviados 6)))


(format t "teste de analise-final~%")
(let ((resultado (analise-final *lista-ocorrencias-teste*)))
  (format t "ocorrencias criticas: ~A~%" resultado))
