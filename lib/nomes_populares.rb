 require 'io/console'
  require_relative 'ibge_dados'

  VIEW = 1
  EXIT = 4

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end



  def menu
    puts '->->->->->->->->->M E N U ->->->->->->->->->->'
    puts "[#{VIEW}]Ranking dos nomes mais populares"
      #Listar todas UFs e obter a sigla da UF que o usuário deseja consultar
    puts "[#{VIEW}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[4] Sair"
    print 'Escolha uma opção: '
    gets.to_i 
   
  end

  def clear
    system('clear')
  end


  clear
  puts welcome
  option = menu

  while option != EXIT
    if  option == VIEW 
    print IbgeDados.estados_all
  
    break

end   
end