using System;
using System.Collections.Generic;

class Feitico
{
    public string Nome { get; }

    public Feitico(string nome)
    {
        Nome = nome;
    }
}

class Grimorio
{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico f)
    {
        feiticos.Add(f);
    }

    public void ListarFeiticos()
    {
        Console.WriteLine("Feitiços no Grimório:");
        foreach (var f in feiticos)
            Console.WriteLine($"- {f.Nome}");
    }
}

class Ferramenta
{
    public string Nome { get; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

class Maga
{
    private string nome;
    private Grimorio grimorio = new Grimorio();
    private List<Ferramenta> ferramentas = new List<Ferramenta>();

    public Maga(string n)
    {
        nome = n;
    }

    public void AdicionarFerramenta(Ferramenta f)
    {
        ferramentas.Add(f);
    }

    public Grimorio GetGrimorio()
    {
        return grimorio;
    }

    public void ListarFerramentas()
    {
        Console.WriteLine($"Ferramentas de {nome}:");
        foreach (var f in ferramentas)
            Console.WriteLine($"- {f.Nome}");
    }
}

class Program
{
    static void Main()
    {
        Ferramenta lanterna = new Ferramenta("Lanterna");
        Ferramenta corda = new Ferramenta("Corda");
        Ferramenta mapa = new Ferramenta("Mapa");

        Maga frieren = new Maga("Frieren");
        frieren.AdicionarFerramenta(lanterna);
        frieren.AdicionarFerramenta(corda);
        frieren.AdicionarFerramenta(mapa);

        frieren.GetGrimorio().AdicionarFeitico(new Feitico("Chama Azul"));
        frieren.GetGrimorio().AdicionarFeitico(new Feitico("Luz Restauradora"));

        frieren.GetGrimorio().ListarFeiticos();
        frieren.ListarFerramentas();
    }
}
