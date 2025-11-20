;;;; loja-maldicoes.lisp
;;;; sistema simples de gerenciamento de itens amaldiçoados


;; 1. estrutura e catalogo
;; definicao da estrutura item com campos:
;; nome, tipo, preco, forca-magica

(defstruct item
  nome
  tipo
  preco
  forca-magica)


;; catalogo inicial com armas, pocoes e artefatos

(defparameter *catalogo-itens*
  (list
   (make-item
    :nome "espada sombria"
    :tipo "Arma"
    :preco 100
    :forca-magica 70)

   (make-item
    :nome "machado do abismo"
    :tipo "Arma"
    :preco 200
    :forca-magica 90)

   (make-item
    :nome "pocao de sangue antigo"
    :tipo "Pocao"
    :preco 50
    :forca-magica 40)

   (make-item
    :nome "amuleta da ruina eterna"
    :tipo "Artefato"
    :preco 500
    :forca-magica 120)))


;; 2. funcoes de transformacao

;; funcao pura: adiciona-imposto
;; aumenta o preco em 15%

(defun adiciona-imposto (preco)
  "retorna o preco com 15 por cento de aumento."
  (* preco 1.15))


;; funcao pura: bonus-maldicao
;; se forca-magica > 80, retorna forca * 1.5
;; caso contrario, retorna a mesma forca

(defun bonus-maldicao (forca)
  "retorna a forca com bonus de maldicao se aplicavel."
  (if (> forca 80)
      (* forca 1.5)
      forca))


;; 3. funcao processa-venda
;; ordem:
;; a) filtra: mantem apenas itens do tipo "Arma"
;; b) transforma 1: usa mapcar + lambda para aumentar preco
;;    de cada arma usando adiciona-imposto
;; c) transforma 2: usa mapcar para retornar lista com
;;    (nome-da-arma, nova-forca-magica)
;;    onde nova-forca-magica = bonus-maldicao(forca-magica original)

(defun processa-venda (catalogo)
  "processa a venda de armas, aplicando imposto e bonus de maldicao.
retorna uma lista de listas: (nome nova-forca-magica novo-preco)."
  (let* ((apenas-armas
          (remove-if-not
           (lambda (it)
             (string= (item-tipo it) "Arma"))
           catalogo))
         ;; aplica imposto no preco das armas
         (armas-com-imposto
          (mapcar
           (lambda (it)
             (make-item
              :nome (item-nome it)
              :tipo (item-tipo it)
              :preco (adiciona-imposto (item-preco it))
              :forca-magica (item-forca-magica it)))
           apenas-armas)))
    ;; transforma em lista com nome, nova forca e novo preco
    (mapcar
     (lambda (it)
       (list (item-nome it)
             (bonus-maldicao (item-forca-magica it))
             (item-preco it)))
     armas-com-imposto)))


;; testes simples

(format t "teste 1 - catalogo original~%")
(dolist (it *catalogo-itens*)
  (format t "item: ~A, tipo: ~A, preco: ~A, forca: ~A~%"
          (item-nome it)
          (item-tipo it)
          (item-preco it)
          (item-forca-magica it)))

(format t "~%teste 2 - processa-venda (apenas armas)~%")
(dolist (info (processa-venda *catalogo-itens*))
  (destructuring-bind (nome nova-forca novo-preco) info
    (format t "arma: ~A | nova forca: ~A | novo preco: ~A~%"
            nome nova-forca novo-preco)))
