require 'io/console'
require_relative 'ibge_dados'
  
INSERT = 1
VIEW = 2
SEARCH = 3
EXIT = 4

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end



  def menu
    puts '->->->->->->->->->M E N U ->->->->->->->->->->'
    puts "[#{INSERT}]Ranking dos nomes mais populares"
    puts "[#{VIEW}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[#{EXIT}] Sair"
    puts '->->->->->->->->->->->->->->->->->->->->->->->'

    print 'Escolha uma opção: '
    gets.to_i 
  end

  def clear
    system('clear')
  end


  clear
  puts welcome
  option = menu

  while option != 4
    if  option == INSERT 
   puts IbgeDados.tables
    elsif option == VIEW
   puts IbgeDados.municipios_all
    break

end   
end