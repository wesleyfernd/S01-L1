// simulacao de batalha pokemon - poo em javascript

// classe base
class Pokemon {
  #vida // atributo privado (protegido contra alteracoes externas)

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome
    this.tipo = tipo
    this.#vida = vidaInicial
  }

  getVida() {
    return this.#vida
  }

  // apenas a propria classe e subclasses podem alterar a vida
  receberDano(dano) {
    this.#vida -= dano
    if (this.#vida < 0) this.#vida = 0
    console.log(`${this.nome} recebeu ${dano} de dano. vida atual: ${this.#vida}`)
  }

  // metodo generico, sobrescrito nas subclasses
  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}!`)
  }
}

// subclasse de fogo
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "fogo", vidaInicial)
    this.bonusAtaque = bonusAtaque
  }

  atacar(alvo) {
    const dano = 20 + this.bonusAtaque
    console.log(`${this.nome} lanca um ataque de fogo causando ${dano} de dano!`)
    alvo.receberDano(dano)
  }
}

// subclasse de agua
class PokemonAgua extends Pokemon {
  constructor(nome, vidaInicial, curaBase) {
    super(nome, "agua", vidaInicial)
    this.curaBase = curaBase
  }

  atacar(alvo) {
    const dano = 15
    console.log(`${this.nome} dispara um jato dagua causando ${dano} de dano!`)
    alvo.receberDano(dano)
    console.log(`${this.nome} se cura em ${this.curaBase} pontos de vida.`)
    this.#curar(this.curaBase)
  }

  // metodo privado - apenas a propria classe pode chamar
  #curar(valor) {
    console.log(`${this.nome} sente-se revitalizado! (+${valor} hp)`)
  }
}

// simulacao de batalha
const charizard = new PokemonFogo("charizard", 100, 10)
const squirtle = new PokemonAgua("squirtle", 100, 5)

console.log("=== inicio da batalha ===\n")

charizard.atacar(squirtle)
squirtle.atacar(charizard)
charizard.atacar(squirtle)

console.log("\n=== fim da batalha ===")
console.log(`${charizard.nome} (vida: ${charizard.getVida()})`)
console.log(`${squirtle.nome} (vida: ${squirtle.getVida()})`)