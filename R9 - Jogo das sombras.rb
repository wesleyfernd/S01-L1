# module rastreavel
module Rastreavel
  def obter_localizacao(hora)
    puts "#{@nome} esta na localizacao #{@localizacao} as #{hora}"
  end
end

# module perigoso
module Perigoso
  def calcular_risco
    risco = rand(1..10)
    puts "#{@nome} tem nivel de risco #{risco}"
    risco
  end
end

# classe base participante
class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end
end

# classe detetive (inclui rastreavel)
class Detetive < Participante
  include Rastreavel
end

# classe mestredocrime (inclui rastreavel e perigoso)
class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso
end

# classe cenario (agrega lista de participantes)
class Cenario
  def initialize
    @participantes = []
  end

  def adicionar_participante(participante)
    @participantes << participante
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end

# ---------- main ----------
cenario = Cenario.new

puts "digite a localizacao do detetive sherlock:"
loc_sherlock = gets.chomp
sherlock = Detetive.new("sherlock", loc_sherlock)

puts "digite a localizacao do mestre do crime moriarty:"
loc_moriarty = gets.chomp
moriarty = MestreDoCrime.new("moriarty", loc_moriarty)

cenario.adicionar_participante(sherlock)
cenario.adicionar_participante(moriarty)

puts "\nverificando localizacoes..."
sherlock.obter_localizacao("10:30")
moriarty.obter_localizacao("10:30")

puts "\ncalculando riscos..."
moriarty.calcular_risco

puts "\nidentificando ameacas..."
ameacas = cenario.identificar_ameacas
ameacas.each { |a| puts "ameaca detectada: #{a.nome}" }
