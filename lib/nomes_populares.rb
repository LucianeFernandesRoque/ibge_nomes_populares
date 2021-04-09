require 'io/console'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'terminal-table'

VIEW = 1
VIEW_CIDADES = 2
VIEW_NOMES = 3
EXIT = 4

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end

  def menu
    puts '->->->->->->->->->M E N U ->->->->->->->->->->'
    puts "[#{VIEW}]Escolha a Uf que deseja visualizar os nomes mais comuns"
    puts "[#{VIEW_CIDADES}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[#{VIEW_NOMES}] Verificar a frequência do uso de um nome"
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


def wait_and_clear
  wait_keypress
  clear
end

clear
puts welcome
option = menu

while option != 4
  if  option == VIEW
    print IbgeDados.tables_estado
    puts RankingNomes.tables_nomes
    break
  elsif option == VIEW_CIDADES
    puts IbgeDados.tables_municipios_all
    break
  elsif option == VIEW_NOMES
    puts RankingNomes.tables_nomes
    break

  end
end
