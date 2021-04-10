require 'terminal-table'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'faraday'
require 'sqlite3'
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
    print 'Selecione F ou M'
    sexo = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?sexo=#{sexo}&localidade=#{id}")
    json = JSON.parse(response.body, symbolize_keys: true)
    json.map do |ranking|
      ranking['res'].map do |nomes|
        @nomes = nomes.fetch_values('nome', 'ranking', 'frequencia')
      end
    end
  end

    def self.table_nomes
    @rows = nomes_all
    @table = Terminal::Table.new :rows => nomes_all.to_a
    @table = Terminal::Table.new title: 'Ranking de nomes', headings: %w[Nome Ranking Frequencia], rows: self.nomes_all
  end
end
