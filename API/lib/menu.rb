  require 'io/console'
  require_relative 'ibge_dados'


  def welcome
    'Bem vindo ao sistema nomes do Brasil'
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

  puts welcome

  popular_names = []
  option = menu

  while option != 4

  break
  end
  

    



