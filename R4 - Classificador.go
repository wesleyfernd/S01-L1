package main

import (
	"fmt"
)

func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo"
	} else {
		return "Zero"
	}
}

func main() {
	var numero int
	fmt.Print("Digite um número: ")
	fmt.Scan(&numero)

	resultado := classificar_numero(numero)
	fmt.Println("O número é:", resultado)
}
