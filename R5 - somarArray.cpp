#include <iostream>
#include <iomanip>
using namespace std;

// Função para somar os valores de um array
float somarArray(float arr[], int tamanho) {
    float soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;
    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho]; // declaração do array

    cout << "Digite os valores do array:\n";
    for (int i = 0; i < tamanho; i++) {
        cout << "Valor " << i + 1 << ": ";
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << fixed << setprecision(2);
    cout << "A soma dos valores do array = " << resultado << endl;

    return 0;
}
