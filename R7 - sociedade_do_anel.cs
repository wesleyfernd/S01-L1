using System;

class MembroDaSociedade
{
    private string nome;
    private string raca;
    private string funcao;

    public MembroDaSociedade(string n, string r, string f)
    {
        nome = n;
        raca = r;
        funcao = f;
    }

    public void Descrever()
    {
        Console.WriteLine($"Nome: {nome}");
        Console.WriteLine($"Raça: {raca}");
        Console.WriteLine($"Função: {funcao}");
        Console.WriteLine("------------------------");
    }
}

class Program
{
    static void Main()
    {
        MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

        aragorn.Descrever();
        legolas.Descrever();
    }
}
