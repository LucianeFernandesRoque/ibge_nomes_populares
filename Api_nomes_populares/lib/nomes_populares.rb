  require 'io/console'
  require_relative 'ibge_estados'


  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end

  def menu()
    puts "[1] Consultar ranking dos nomes mais comuns de uma UF"
      #Listar todas UFs e obter a sigla da UF que o usuário deseja consultar
    puts "[2] Visualizar ranking dos nomes mais comuns em uma determinada cidade"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[4] Sair"

    print 'Escolha uma opção: '
    gets.to_i

  end

  def estados_all
    print_items(IbgeEstados.all)
  end


  puts welcome

  popular_names = []
  option = menu

  while optio n != 4

  break
  end
  

    



