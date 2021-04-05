require 'io/console'
require_relative 'ibge_dados'
  
VIEW = 1
SEARCH = 2
INSERT = 3
EXIT = 4

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end



  def menu
    puts '->->->->->->->->->M E N U ->->->->->->->->->->'
    puts "[#{VIEW}]Ranking dos nomes mais populares"
    puts "[#{SEARCH}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[#{EXIT}] Sair"
    puts '->->->->->->->->->->->->->->->->->->->->->->->'

    print 'Escolha uma opção: '
    gets.to_i 
  end

  def search_states
    print 'Digite a siga do estado: '
    term = gets.chomp
    estados_all = tables_estado.filter do |item|
    item.include? term
  end
    print_items(estados_all)
end

  def clear
    system('clear')
  end


  clear
  puts welcome
  option = menu

  while option != 4
    if  option == VIEW 
   puts IbgeDados.tables_estado
    elsif option == VIEW
   puts IbgeDados.tables_municipios
    break

end   
end