require 'io/console'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'terminal-table'

VIEW_STATES = 1
VIEW_CITIES = 2
INSERT_NOMES = 3
EXIT = 4

def welcome
  'Bem vindo ao sistema nomes mais comuns do Brasil'
end

def menu
  puts '->->->->->->->->->M E N U ->->->->->->->->->->'.red
  puts "[#{VIEW_STATES}]Escolha a UF que deseja visualizar o ranking dos nomes mais comuns"
  puts "[#{VIEW_CITIES}] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
  puts "[#{INSERT_NOMES}] Digite um ou mais nomes(separando por vírgula)para consultar a frequência de um nome ao longo dos anos"
  puts "[#{EXIT}] Sair"
  puts '->->->->->->->->->->->->->->->->->->->->->->->'.red

  print 'Escolha uma opção: '
  gets.to_i
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
  if  option == VIEW_STATES
    puts IbgeDados.tables_estado
    puts RankingNomes.table_nomes
    break
  elsif option == VIEW_CITIES
    puts IbgeDados.tables_municipios_all
    puts RankingNomes.table_nomes
    break
  elsif option == INSERT_NOMES
    puts RankingNomes.table_decadas
    break
  end
end
