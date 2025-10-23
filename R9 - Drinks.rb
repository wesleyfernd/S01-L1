# classe base drink
class Drink
  attr_reader :nome  # apenas leitura do nome

  def initialize(nome, preco_base)
    @_nome = nome
    self.preco_base = preco_base  # usa o setter para validar
  end

  # getter explicito
  def preco_base
    @_preco_base
  end

  # setter explicito com validacao
  def preco_base=(valor)
    if valor > 0
      @_preco_base = valor
    else
      raise "o preco deve ser positivo!"
    end
  end

  # metodo que retorna o preco final (pode ser sobrescrito)
  def preco_final
    @_preco_base
  end

  # metodo to_s (equivalente a __str__)
  def to_s
    "drink: #{@_nome}, preco base: $#{@_preco_base}"
  end
end

# subclasse drinklenda
class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @_anos_desde_criacao = anos_desde_criacao
  end

  # sobrescreve o calculo do preco final
  def preco_final
    @_preco_base + (5 * @_anos_desde_criacao)
  end

  # sobrescreve o metodo to_s
  def to_s
    "drink lenda: #{@_nome}, preco base: $#{@_preco_base}, " \
    "anos desde criacao: #{@_anos_desde_criacao}, preco final: $#{preco_final}"
  end
end

# ---------- main ----------
puts "digite o nome do drink:"
nome = gets.chomp

puts "digite o preco base:"
preco = gets.chomp.to_f

puts "digite os anos desde a criacao (para drinklenda):"
anos = gets.chomp.to_i

drink = DrinkLenda.new(nome, preco, anos)

puts "\nresultado:"
puts drink.to_s
