10 INPUT "Digite a primeira nota: "; nota1
20 INPUT "Digite a segunda nota: "; nota2
30 LET media = (VAL(nota1) + VAL(nota2))/ 2
40 PRINT "Media = "+ media
50 IF media > 60 THEN PRINT "Aprovado direto"
60 IF media < 30 THEN PRINT "Reprovado direto"
70 INPUT "Digite a nota da NP3: "; nota3
80 LET media = (val(media) + val(nota3))/ 2
90 PRINT "Nova media = "+ media
100 IF media > 50 THEN PRINT "Aprovado pela NP3"
110 IF media < 50 THEN PRINT "Reprovado na NP3"
120 END
