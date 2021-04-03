require 'io/console'
require_relative 'ibge_dados'


  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end



  def menu
    puts '->->->->->->->->->M E N U ->->->->->->->->->->'
    puts "[1]Ranking dos nomes mais populares"
    puts "[2] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[4] Sair"
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

  while option != EXIT
    if  option == VIEW 
   puts IbgeDados.estados_all
    elsif option == INSERT
   puts IbgeDados.municipios_all
    break

end   
end