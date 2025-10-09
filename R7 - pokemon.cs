using System;

class Pokemon
{
    protected string nome;

    public Pokemon(string n)
    {
        nome = n;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{nome} realiza um ataque genérico!");
    }
}

class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string n) : base(n) { }

    public override void Atacar()
    {
        Console.WriteLine($"{nome} lança uma rajada de fogo!");
    }
}

class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string n) : base(n) { }

    public override void Atacar()
    {
        Console.WriteLine($"{nome} lança um jato de água!");
    }
}

class Program
{
    static void Main()
    {
        Pokemon[] lista = {
            new PokemonDeFogo("Charizard"),
            new PokemonDeAgua("Blastoise")
        };

        foreach (var p in lista)
            p.Atacar();
    }
}
