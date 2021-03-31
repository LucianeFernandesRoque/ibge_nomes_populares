  require 'io/console'
  require_relative 'ibge_dados'

  def welcome
    'Bem vindo ao sistema nomes mais comuns do Brasil'
  end

  def menu()
    puts "[1] Digite a UF de estado para  visualizar os nomes mais comuns"
      #Listar todas UFs e obter a sigla da UF que o usuário deseja consultar
    puts "[2] EScolha uma cidade para visualizar o ranking dos nomes mais comuns"
    puts "[3] Verificar a frequência do uso de um nome"
    puts "[4] Sair"

    print 'Escolha uma opção: '
    gets.to_i

  end



    



