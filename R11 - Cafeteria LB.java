import java.util.ArrayList;

public class CafeLeblancMain {
    public static void main(String[] args) {
        // cria o menu da cafeteria
        Menu menu = new Menu();
        
        // cria alguns cafes
        Cafe cafeNormal = new Cafe("Cafe Preto", 5.0);
        CafeGourmet cafeEspecial = new CafeGourmet("Cafe Gourmet", 8.0, 2.0);
        
        // adiciona os cafes ao menu
        menu.adicionarItem(cafeNormal);
        menu.adicionarItem(cafeEspecial);
        
        // cria a cafeteria e associa o menu
        CafeLeblanc cafeteria = new CafeLeblanc(menu);
        
        // exibe os pedidos recebidos
        cafeteria.receberPedido(cafeNormal);
        cafeteria.receberPedido(cafeEspecial);
    }
}

// classe cafe
class Cafe {
    protected String nome;
    protected double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public void setPrecoBase(double precoBase) {
        this.precoBase = precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

// classe cafegourmet (herda cafe)
class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return precoBase + bonusAroma;
    }
}

// classe menu
class Menu {
    private ArrayList<Cafe> itens;

    public Menu() {
        this.itens = new ArrayList<>();
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
}

// classe cafeleblanc
class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome() + 
                           " - preco final: R$ " + cafe.calcularPrecoFinal());
    }
}
