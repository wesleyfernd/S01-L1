#include <iostream>
#include <iomanip> 
using namespace std;

// Função recursiva para calcular Fibonacci
int fibonacci(int n) {
    if (n == 0) return 0;       // caso base 1
    if (n == 1) return 1;       // caso base 2
    return fibonacci(n - 1) + fibonacci(n - 2); // chamada recursiva
}

int main() {
    int n;
    cout << "Digite um numero: ";
    cin >> n;

    cout << "Fibonacci(" << n << ") = " 
         << setw(10) << fibonacci(n) << endl;

    return 0;
}
