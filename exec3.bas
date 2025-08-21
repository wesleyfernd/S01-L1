  10 INPUT "Digite a temperatura em Celsius: "; celsius
  20 LET kelvin = VAL(celsius) + 273.15
  30 LET fahrenheit = VAL(celsius) * 9 / 5 + 32
  40 PRINT "Temperatura em Celsius: "+ celsius
  50 PRINT "Temperatura em Kelvin: "+ kelvin
  60 PRINT "Temperatura em Fahrenheit: "+ fahrenheit
  70 END