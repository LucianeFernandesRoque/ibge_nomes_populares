  require 'io/console'
  require_relative 'ibge_dados'
  require_relative 'ranking_nomes'

  VIEW = 1
  EXIT = 4

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end

  def menu
    puts "[#{VIEW}]Ranking dos nomes por UF"
      #Listar todas UFs e obter a sigla da UF que o usuário deseja consultar
    puts "[2] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[4] Sair"

    print 'Escolha uma opção: '
    gets.to_i

  end


  
  puts welcome
  option = menu

  while option != EXIT
    if  option == VIEW 
      IbgeDados.estados_all
    break
end   
end
