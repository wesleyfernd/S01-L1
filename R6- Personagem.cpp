#include <iostream>
#include <string>
using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;

    void atacar(Personagem &alvo) {
        cout << nome << " atacou " << alvo.nome 
             << " causando " << dano << " de dano!" << endl;
        alvo.vida -= dano;
        if (alvo.vida < 0) {
            alvo.vida = 0;
        }
    }

    void exibirStatus() {
        cout << "Nome: " << nome << endl;
        cout << "Nível: " << nivel << endl;
        cout << "Dano: " << dano << endl;
        cout << "Vida: " << vida << endl;
        cout << "----------------------" << endl;
    }
};

int main() {
    Personagem p1;
    p1.nome = "Arthas";
    p1.nivel = 5;
    p1.dano = 15;
    p1.vida = 100;

    Personagem p2;
    p2.nome = "Sylvanas";
    p2.nivel = 4;
    p2.dano = 12;
    p2.vida = 90;

    cout << "STATUS INICIAL:" << endl;
    p1.exibirStatus();
    p2.exibirStatus();

    p1.atacar(p2);

    cout << "\nSTATUS APÓS O COMBATE:" << endl;
    p1.exibirStatus();
    p2.exibirStatus();

    return 0;
}