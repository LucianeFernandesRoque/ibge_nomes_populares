require 'terminal-table'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade, sexo, nome, frequencia, ranking)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
  end

  def self.nomes_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=')
    print 'Digite o id da localidade?'
    id = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{id}")
    json = JSON.parse(response.body, symbolize_keys: true)
    json.map do |ranking|
      ranking.dig('res').map do |nomes|
        nomes = nomes.fetch_values('nome', 'ranking', 'frequencia')
      end
    end
  end

  def self.tables_nomes
    rows = []
    table = Terminal::Table.new title: 'Ranking', headings: ['Nome, ranking, frequencia'], rows: nomes_all
  end
end
