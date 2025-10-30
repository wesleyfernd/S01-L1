// interface rastreavel
class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("metodo rastrearLocal deve ser implementado")
  }
}

// classe base hunter
class Hunter extends IRastreavel {
  constructor(nome, local, idade) {
    super()
    this.nome = nome
    this.localizacao = local
    this.idade = idade
  }
}

// classe especialista que herda de hunter
class Especialista extends Hunter {
  constructor(nome, habilidade, local = "desconhecido", idade = 0) {
    super(nome, local, idade)
    this.habilidadeNen = habilidade
  }

  rastrearLocal(lat, long) {
    this.localizacao = `lat: ${lat}, long: ${long}`
    return `${this.nome} rastreou local usando habilidade ${this.habilidadeNen} -> ${this.localizacao}`
  }
}

// classe manipulador que herda de hunter
class Manipulador extends Hunter {
  constructor(nome, alvo = null, local = "desconhecido", idade = 0) {
    super(nome, local, idade)
    this.alvoAtual = alvo
  }

  rastrearLocal(lat, long) {
    this.localizacao = `lat: ${lat}, long: ${long}`
    const alvoInfo = this.alvoAtual ? `alvo: ${this.alvoAtual.nome}` : "sem alvo"
    return `${this.nome} rastreou local (${alvoInfo}) -> ${this.localizacao}`
  }
}

// classe batalhao que armazena hunters sem duplicar nomes
class Batalhao {
  constructor() {
    this.hunters = new Set()
  }

  adicionarHunter(hunter) {
    // verifica duplicatas pelo nome
    for (let h of this.hunters) {
      if (h.nome === hunter.nome) {
        console.log(`hunter ${hunter.nome} ja esta no batalhao`)
        return
      }
    }
    this.hunters.add(hunter)
  }

  getNumHunters() {
    return this.hunters.size
  }

  iniciarRastreamento(lat, long) {
    let resultados = []
    for (let h of this.hunters) {
      resultados.push(h.rastrearLocal(lat, long))
    }
    return resultados
  }
}

// exemplo de uso
const gon = new Especialista("gon", "ten", "montanha", 12)
const killua = new Manipulador("killua", gon, "floresta", 12)
const kurapika = new Especialista("kurapika", "correntes", "cidade", 15)

const batalhao = new Batalhao()
batalhao.adicionarHunter(gon)
batalhao.adicionarHunter(killua)
batalhao.adicionarHunter(kurapika)
batalhao.adicionarHunter(gon) // tentativa duplicada

console.log(batalhao.iniciarRastreamento("-23.5", "-46.6"))