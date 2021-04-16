require 'terminal-table'
require_relative 'ibge_estados'
require_relative 'ibge_cidades'
require 'faraday'
require 'json'

class FrequenciaNomes
  attr_accessor :nome, :frequencia, :periodo

  def initialize=(nome, frequencia, periodo, decadas)
    @nome = nome
    @frequencia = frequencia
    @periodo = periodo
    @decadas = decadas
  end

  def self.frequencia_decadas
    puts 'Digite o nome para obter a frequencia por décadas'
    nome = gets.chomp
    q = 'nome'
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/#{q}%7C")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |decadas|
    @decadas = decadas[:res].map do |frequencia|
    @frequencia = nome, frequencia[:frequencia], frequencia[:periodo]
    end
    end
  end

  def self.table_decadas
   @rows = []
   @table = Terminal::Table.new rows: @rows
   @table = Terminal::Table.new title: 'Frequencia por decada'.blue, headings: ['Nome'.cyan, 'frequencia'.cyan, 'Periodo'.cyan],
                                 rows: frequencia_decadas
  end
end
