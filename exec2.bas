    10 RANDOMIZE = TIMER
    20 LET numero = INT(RND * 101)
    30 input "Tente adivinhar o número (0 a 100): "; palpite
    40 IF palpite = numero THEN GOTO 100
    50 IF palpite < numero THEN PRINT "O número correto é MAIOR"
    60 IF palpite > numero THEN PRINT "O número correto é MENOR"
    70 INPUT "Tente novamente: "; palpite
    80 GOTO 30
    100 PRINT "Parabéns! Você acertou o número: "+ numero
    110 END