#include <iostream>
#include <string>
using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(const string &n) : nome(n) {}

    virtual void apresentar() {
        cout << "Sou um ser vivo chamado " << nome << "." << endl;
    }

    virtual ~SerVivo() {}
};

class Humano : public SerVivo {
public:
    Humano(const string &n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Olá! Eu sou o humano " << nome << "." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(const string &n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Saudações! Eu sou o elfo " << nome << "." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(const string &n) : SerVivo(n) {}

    void apresentar() override {
        cout << "Encantos! Eu sou a fada " << nome << "." << endl;
    }
};

int main() {
    SerVivo* seres[3];

    seres[0] = new Humano("Arthur");
    seres[1] = new Elfo("Legolas");
    seres[2] = new Fada("Tinker Bell");

    for (int i = 0; i < 3; i++) {
        seres[i]->apresentar();
    }

    for (int i = 0; i < 3; i++) {
        delete seres[i];
    }

    return 0;
}