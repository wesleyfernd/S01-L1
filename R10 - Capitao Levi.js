// simulacao de esquadrao do capitao levi - poo em javascript

// interface iexplorador
class IExplorador {
  explorarTerritorio() {
    throw new Error("metodo explorarTerritorio deve ser implementado")
  }
}

// classe odm_gear
class ODM_Gear {
  #gasRestante

  constructor(modelo) {
    this.modelo = modelo
    this.#gasRestante = 100
  }

  usarGas(quantidade) {
    if (quantidade > this.#gasRestante) {
      console.log("sem gas suficiente!")
      this.#gasRestante = 0
    } else {
      this.#gasRestante -= quantidade
      console.log(`usando ${quantidade} de gas... restante: ${this.#gasRestante}`)
    }
  }

  getGas() {
    return this.#gasRestante
  }
}

// classe soldado que implementa iexplorador
class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super()
    this.nome = nome
    this.gear = new ODM_Gear(modeloGear)
  }

  explorarTerritorio() {
    this.gear.usarGas(20)
    return `${this.nome} esta explorando com o gear ${this.gear.modelo}. gas restante: ${this.gear.getGas()}`
  }

  verificarEquipamento() {
    return `${this.nome} possui gear modelo ${this.gear.modelo} com ${this.gear.getGas()} de gas`
  }
}

// classe esquadrao
class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider
    this.membros = membrosIniciais
  }

  adicionarMembro(soldado) {
    if (soldado instanceof IExplorador) {
      this.membros.push(soldado)
      console.log(`${soldado.nome} adicionado ao esquadrao`)
    } else {
      console.log(`erro: ${soldado.nome} nao implementa iexplorador`)
    }
  }

  explorarTerritorio() {
    console.log(`lider ${this.lider.nome} iniciou a exploracao!`)
    this.membros.forEach(m => console.log(m.explorarTerritorio()))
  }

  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento())
  }
}

// simulacao
const levi = new Soldado("levi", "mk-iii")
const mikasa = new Soldado("mikasa", "mk-ii")
const armin = new Soldado("armin", "mk-i")

const esquadraoLevi = new Esquadrao(levi, [mikasa])
esquadraoLevi.adicionarMembro(armin)

console.log("\n=== exploracao iniciada ===\n")
esquadraoLevi.explorarTerritorio()

console.log("\n=== status do esquadrao ===")
console.log(esquadraoLevi.relatarStatus())