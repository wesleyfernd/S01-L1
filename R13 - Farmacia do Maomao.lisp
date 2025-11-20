;;;; maomao.lisp
;;;; sistema simples de dosagem e preco de ervas


;; funcao pura: calcula-dosagem
;; regra:
;; - se idade < 5 ou peso < 20kg  -> 10ml
;; - se 5 <= idade <= 12 e peso >= 20kg -> 25ml
;; - caso contrario -> 50ml

(defun calcula-dosagem (peso-kg idade-anos)
  "Retorna a dosagem em ml de acordo com peso e idade."
  (cond
    ((or (< idade-anos 5)
         (< peso-kg 20))
     10)
    ((and (>= idade-anos 5)
          (<= idade-anos 12)
          (>= peso-kg 20))
     25)
    (t
     50)))


;; funcao pura: ajusta-preco
;; regra:
;; - se nome for "Ginseng" -> preco * 3.0
;; - se nome for "Lotus"   -> preco * 1.5
;; - caso contrario -> preco-base

(defun ajusta-preco (preco-base nome-da-erva)
  "Retorna o preco ajustado de acordo com o nome da erva."
  (cond
    ((string= nome-da-erva "Ginseng")
     (* preco-base 3.0))
    ((or (string= nome-da-erva "Lotus")
         (string= nome-da-erva "Lótus")) ;; aceita com ou sem acento
     (* preco-base 1.5))
    (t
     preco-base)))


;; testes simples
;; exemplo pedido:
;; lotus, preco base 10, paciente 14 anos, 60 kg

(format t "teste 1 - lotus, 14 anos, 60kg~%")
(let* ((peso 60)
       (idade 14)
       (erva "Lotus")
       (preco-base 10)
       (dosagem (calcula-dosagem peso idade))
       (preco-final (ajusta-preco preco-base erva)))
  (format t "dosagem: ~A ml~%" dosagem)
  (format t "preco final: ~A moedas~%~%" preco-final))


;; outros testes para mostrar os casos

(format t "teste 2 - crianca pequena: 3 anos, 18kg~%")
(format t "dosagem: ~A ml~%~%"
        (calcula-dosagem 18 3))

(format t "teste 3 - crianca entre 5 e 12, 10 anos, 25kg~%")
(format t "dosagem: ~A ml~%~%"
        (calcula-dosagem 25 10))

(format t "teste 4 - ginseng, preco base 10~%")
(format t "preco ajustado: ~A~%~%"
        (ajusta-preco 10 "Ginseng"))

(format t "teste 5 - camomila, preco base 10~%")
(format t "preco ajustado: ~A~%"
        (ajusta-preco 10 "Camomila"))
