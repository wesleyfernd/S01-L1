import java.util.*;

// classe padrao de ataque
class PadraoAtaque {
    private String nome;
    private int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public String getNome() {
        return nome;
    }

    public int getDano() {
        return dano;
    }
}

// classe boss
class Boss {
    protected String nome;
    protected String idBoss;
    protected String pontoFraco;
    protected LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("iniciando fase contra " + nome);
        for (PadraoAtaque a : moveset) {
            System.out.println("ataque: " + a.getNome() + " - dano: " + a.getDano());
        }
    }

    public String getIdBoss() {
        return idBoss;
    }
}

// classe boss magico (heranca)
class BossMagico extends Boss {
    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("o boss magico " + nome + " surge com poder arcano!");
        super.iniciarFase();
    }
}

// classe batalha (agregacao)
class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getIdBoss(), boss);
        System.out.println("boss " + boss.nome + " adicionado a arena");
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("boss nao encontrado");
        }
    }
}

// classe principal
public class ArenaMain {
    public static void main(String[] args) {
        // cria ataques
        PadraoAtaque fogo = new PadraoAtaque("bola de fogo", 80);
        PadraoAtaque raio = new PadraoAtaque("raio magico", 90);
        PadraoAtaque soco = new PadraoAtaque("soco forte", 50);

        // cria bosses
        BossMagico mago = new BossMagico("mago sombrio", "B001", "agua");
        Boss guerreiro = new Boss("guerreiro de ferro", "B002", "raio");

        // adiciona ataques
        mago.adicionarAtaque(fogo);
        mago.adicionarAtaque(raio);
        guerreiro.adicionarAtaque(soco);

        // cria batalha e adiciona bosses
        Batalha batalha = new Batalha();
        batalha.adicionarBoss(mago);
        batalha.adicionarBoss(guerreiro);

        // inicia batalha com boss magico
        batalha.iniciarBatalha("B001");
    }
}
