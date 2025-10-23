# classe microondasunidade (composicao)
class MicroondasUnidade
  def aquecer_por(segundos)
    puts "aquecendo por #{segundos} segundos..."
  end
end

# classe dmail (agregacao)
class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end
end

# classe telefonedemicroondas (todo)
class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmail_list = []
  end

  def enviar_dmail
    puts "digite o conteudo do dmail:"
    conteudo = gets.chomp
    puts "digite a hora de envio (ex: 10:30):"
    hora_envio = gets.chomp

    @unidade.aquecer_por(3)
    dmail = DMail.new(conteudo, hora_envio)
    @dmail_list << dmail
    puts "dmail enviado com sucesso!\n\n"
  end

  def listar_dmails(horario_corte)
    puts "dmails enviados apos #{horario_corte}:"
    filtrados = @dmail_list.select { |d| d.hora_envio > horario_corte }
    if filtrados.empty?
      puts "nenhum dmail encontrado."
    else
      filtrados.each do |d|
        puts "- #{d.conteudo} (enviado as #{d.hora_envio})"
      end
    end
  end
end

# ---------- main ----------
telefone = TelefoneDeMicroondas.new

loop do
  puts "\n1 - enviar dmail"
  puts "2 - listar dmails por horario"
  puts "3 - sair"
  print "escolha uma opcao: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    telefone.enviar_dmail
  when 2
    puts "digite o horario de corte (ex: 09:00):"
    horario_corte = gets.chomp
    telefone.listar_dmails(horario_corte)
  when 3
    puts "saindo..."
    break
  else
    puts "opcao invalida."
  end
end
