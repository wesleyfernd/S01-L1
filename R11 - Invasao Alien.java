import java.util.HashMap;

public class RegistrosOcultosMain {
    public static void main(String[] args) {
        // cria alguns poderes
        Poder poder1 = new Poder("Telepatia");
        Poder poder2 = new Poder("Invisibilidade");

        // cria entidades
        Youkai y1 = new Youkai("Kitsune", "Montanhas", poder1);
        Alien a1 = new Alien("Zorg", "Marte", "Disco Voador", poder2);

        // cria registro oculto
        Registros registro = new Registros("Equipe Secreta");

        // registra avistamentos
        registro.registrarAvistamento(y1, y1.getNome());
        registro.registrarAvistamento(a1, a1.getNome());
        registro.registrarAvistamento(a1, a1.getNome()); // tentativa repetida

        // mostra coordenadas
        System.out.println(y1.obterCoordenadas());
        System.out.println(a1.obterCoordenadas());
    }
}

// interface rastreavel
interface IRastreavel {
    String obterCoordenadas();
}

// classe poder
class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}

// classe entidades (superclasse)
abstract class Entidades implements IRastreavel {
    protected String nome;
    protected String localizacao;
    protected Poder poder;

    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    public void setPoder(Poder poder) {
        this.poder = poder;
    }

    @Override
    public abstract String obterCoordenadas();
}

// classe youkai
class Youkai extends Entidades {
    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai " + nome + " avistado em " + localizacao +
               " com poder " + poder.getNome();
    }
}

// classe alien
class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planetaOrigem, String ovni, Poder poder) {
        super(nome, planetaOrigem, poder);
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien " + nome + " vindo de " + planetaOrigem +
               " no " + ovni + " com poder " + poder.getNome();
    }
}

// classe registros
class Registros {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade, String nome) {
        if (avistamentos.containsKey(nome)) {
            System.out.println("entidade " + nome + " ja registrada");
            return false;
        } else {
            avistamentos.put(nome, entidade);
            System.out.println("nova entidade registrada: " + nome);
            return true;
        }
    }
}
