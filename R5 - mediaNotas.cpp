#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int qtdNotas;
    cout << "Digite quantas notas deseja inserir: ";
    cin >> qtdNotas;

    float soma = 0.0;
    for (int i = 0; i < qtdNotas; i++) {
        float nota;
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;

        // validação com while
        while (nota < 0.0 || nota > 10.0) {
            cout << "Nota invalida! Digite novamente (0 a 10): ";
            cin >> nota;
        }

        soma += nota;
    }

    float media = soma / qtdNotas;

    cout << fixed << setprecision(2);
    cout << "Media final = " << media << endl;

    if (media >= 7.0) {
        cout << "Aprovado" << endl;
    } else {
        cout << "Reprovado" << endl;
    }

    return 0;
}
