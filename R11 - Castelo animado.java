import java.util.ArrayList;

public class CasteloAnimado {
    public static void main(String[] args) {
        // cria um mago
        Mago howl = new Mago("Howl", 30, "Metamorfose");
        
        // cria o castelo
        Castelo castelo = new Castelo("Castelo Animado");
        
        // cria e adiciona divisoes
        Divisao sala = new Divisao("Sala de Magia");
        Divisao cozinha = new Divisao("Cozinha Magica");
        castelo.adicionarDivisao(sala);
        castelo.adicionarDivisao(cozinha);
        
        // mostra informacoes
        System.out.println(howl.lancarFeitico());
        System.out.println("Divisoes do " + castelo.getNome() + ":");
        for (Divisao d : castelo.getDivisoes()) {
            System.out.println("- " + d.getNome());
        }
    }
}


// classe personagem

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}

// classe mago (herda personagem)

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String getMagia() {
        return magia;
    }

    public void setMagia(String magia) {
        this.magia = magia;
    }

    public String lancarFeitico() {
        return getNome() + " lancou o feitico: " + magia + "!";
    }
}


// classe divisao

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

// classe castelo

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}
