package main

import (
	"fmt"
)

func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Print(a, " ")
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var n int
	fmt.Print("Digite quantos números da sequência de Fibonacci você deseja: ")
	fmt.Scan(&n)

	fmt.Println("Sequência de Fibonacci:")
	fibonacci(n)
}
