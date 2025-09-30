#include <iostream>
#include <string>
using namespace std;

// Classe base Pessoa
class Pessoa {
private:
    string nome;
    int idade;

public:
    void setNome(const string &n) {
        nome = n;
    }

    void setIdade(int i) {
        idade = i;
    }

    string getNome() const {
        return nome;
    }

    int getIdade() const {
        return idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    void setNivel(int n) {
        nivel = n;
    }

    int getNivel() const {
        return nivel;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    void setRank(int r) {
        if (r >= 0 && r <= 10) {
            rank = r;
        } else {
            cout << "Rank inválido! Deve estar entre 0 e 10." << endl;
        }
    }

    int getRank() const {
        return rank;
    }
};

int main() {
    Protagonista p1;
    p1.setNome("Ren Amamiya");
    p1.setIdade(17);
    p1.setNivel(15);

    Personagem ali;
    ali.setNome("Ryuji Sakamoto");
    ali.setIdade(17);
    ali.setRank(7);

    cout << "=== Protagonista ===" << endl;
    cout << "Nome: " << p1.getNome() << endl;
    cout << "Idade: " << p1.getIdade() << endl;
    cout << "Nível: " << p1.getNivel() << endl;

    cout << "\n=== Personagem Aliado ===" << endl;
    cout << "Nome: " << ali.getNome() << endl;
    cout << "Idade: " << ali.getIdade() << endl;
    cout << "Rank Social: " << ali.getRank() << endl;

    return 0;
}