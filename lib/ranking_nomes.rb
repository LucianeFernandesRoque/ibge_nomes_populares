require 'colorize'
require 'terminal-table'
require_relative 'ibge_dados'
require 'faraday'
require 'json'

class RankingNomes
  attr_accessor :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize=(localidade, _sexo, nome, frequencia, ranking, nome_frequencia)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
    @nome_frequencia = nome_frequencia
  end

  def self.nomes_all
    puts 'Digite o id da uf?'
    puts id = gets.chomp
    puts 'Selecione F ou M'
    sexo = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=#{sexo}&localidade=#{id}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |ranking|
      ranking[:res].map do |nomes|
        @nomes = nomes[:nome], nomes[:ranking], nomes[:frequencia]
      end
    end
  end

  def self.frequencia_decadas
    puts 'Digite o nome para obter a frequencia por décadas'
    nome = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{nome}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |decadas|
      @decadas = decadas[:res].map do |frequencia|
        @frequencia = frequencia[:nome], frequencia[:frequencia], frequencia[:periodo]
      end
    end
  end

  def self.table_decadas
    @rows = []
    @table = Terminal::Table.new title: 'Frequencia por decada'.blue, headings: ['Nome'.cyan, 'frequencia'.cyan, 'Periodo'.cyan],
                                 rows: frequencia_decadas.to_a[0]
  end

  def self.table_nomes
    @rows = []
    @table = Terminal::Table.new title: 'Nomes mais comuns da regiao'.blue, headings: ['Nome'.cyan, 'ranking'.cyan, ' Frequencia'.cyan],
                                 rows: nomes_all.to_a[0]
  end
end
