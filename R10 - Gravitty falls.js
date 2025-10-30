// classe criatura
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome
    this.perigosa = perigosa
  }
}

// classe diario
class Diario {
  #autorSecreto
  constructor(autor) {
    this.#autorSecreto = autor
    this.enigmas = new Map()
    this.criaturasAvistadas = []
  }

  getAutor() {
    return this.#autorSecreto
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma)
  }

  decodificar(chave, num) {
    if (chave === this.#autorSecreto && this.enigmas.has(num)) {
      return this.enigmas.get(num)
    } else {
      return "acesso negado"
    }
  }
}

// classe personagem
class Personagem {
  constructor(nome, idade) {
    this.nome = nome
    this.idade = idade
  }
}

// classe protagonista herda personagem
class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade)
    this.diario = diario
  }
}

// classe cabanamisterio
class CabanaMisterio {
  constructor(diarista) {
    this.diarista = diarista
    this.visitantes = []
    this.funcionarios = [] // lista agregada de personagens
  }

  adicionarFuncionario(personagem) {
    this.funcionarios.push(personagem)
  }

  listarFuncionarios() {
    return this.funcionarios
  }
}

// exemplo de uso
const diario1 = new Diario("dipper")
diario1.adicionarEnigma(1, "criatura misteriosa no lago")
diario1.adicionarEnigma(2, "atividade paranormal na cabana")

console.log(diario1.decodificar("dipper", 1)) // acesso permitido
console.log(diario1.decodificar("mabel", 2)) // acesso negado

const dipper = new Protagonista("dipper", 12, diario1)
const mabel = new Personagem("mabel", 12)
const stan = new Personagem("stan", 60)

const cabana = new CabanaMisterio(diario1)
cabana.adicionarFuncionario(mabel)
cabana.adicionarFuncionario(stan)

console.log(cabana.listarFuncionarios())