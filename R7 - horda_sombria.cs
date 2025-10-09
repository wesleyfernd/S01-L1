using System;

abstract class MonstroSombrio
{
    protected string nome;

    public MonstroSombrio(string n)
    {
        nome = n;
    }

    public abstract void Mover();
}

class Zumbi : MonstroSombrio
{
    public Zumbi(string n) : base(n) { }

    public override void Mover()
    {
        Console.WriteLine($"{nome} anda lentamente, arrastando os pés...");
    }
}

class Espectro : MonstroSombrio
{
    public Espectro(string n) : base(n) { }

    public override void Mover()
    {
        Console.WriteLine($"{nome} flutua rapidamente através das sombras!");
    }
}

class Program
{
    static void Main()
    {
        MonstroSombrio[] monstros = {
            new Zumbi("Zumbi Antigo"),
            new Espectro("Espectro Vingativo")
        };

        foreach (var m in monstros)
            m.Mover();
    }
}
