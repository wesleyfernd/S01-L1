# classe base musico
class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @_nome = nome
    @_instrumento = instrumento
  end

  # metodo abstrato
  def tocar_partitura(peca)
    raise NotImplementedError, "este metodo deve ser implementado na subclasse"
  end
end

# subclasse pianista
class Pianista < Musico
  def tocar_partitura(peca)
    "#{@_nome} toca a peca '#{peca}' com um solo de piano incrivel!"
  end
end

# subclasse violinista
class Violinista < Musico
  def tocar_partitura(peca)
    "#{@_nome} toca a peca '#{peca}' com emocao no violino!"
  end
end

# classe maestro
class Maestro
  def initialize(musicos)
    @_musicos = musicos
  end

  # metodo para iniciar o ensaio
  def iniciar_ensaio(peca)
    puts "iniciando ensaio da peca '#{peca}'..."
    @_musicos.each do |m|
      puts m.tocar_partitura(peca)
    end
  end

  # metodo para mudar foco
  def mudar_foco(estado)
    @_musicos.map do |m|
      puts "#{m.nome} agora esta #{estado}!"
    end
  end
end

# ---------- main ----------
puts "digite o nome da peca a ser tocada:"
peca = gets.chomp

# cria lista de musicos
musicos = [
  Pianista.new("kousei", "piano"),
  Violinista.new("kaori", "violino")
]

maestro = Maestro.new(musicos)

puts "\nensaio iniciado:\n\n"
maestro.iniciar_ensaio(peca)

puts "\nmaestro muda o foco:\n\n"
maestro.mudar_foco("concentrado")
