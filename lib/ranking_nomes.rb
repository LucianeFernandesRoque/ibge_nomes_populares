require 'terminal-table'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'faraday'
require 'json'

class RankingNomes
  attr_accessor :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize=(localidade, _sexo, nome, frequencia, ranking)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
  end

  def self.nomes_all
    print 'Digite o id da uf?'
    id = gets.chomp
    p 'Selecione F ou M'
    sexo = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=#{sexo}&localidade=#{id}")
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |ranking|
      ranking[:res].map do |nomes|
        @nomes = nomes[:nome], nomes[:ranking], nomes[:frequencia]
      end
    end
  end

  def self.table_nomes
    rows = []
    table = Terminal::Table.new title: 'Nomes', headings: %w[Nome ranking Frequencia], rows: nomes_all.to_a[0]
  end
end
