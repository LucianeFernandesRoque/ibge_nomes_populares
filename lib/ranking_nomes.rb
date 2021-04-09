require 'terminal-table'
require_relative 'ibge_dados'
require_relative 'ranking_nomes'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize=(localidade, sexo, nome, frequencia, ranking)
    @localidade = localidade
    @sexo = []
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
  end



  def self.nomes_all
    print 'Digite o id da localidade?'
    id = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{id}")
    json = JSON.parse(response.body, symbolize_keys: true)
    json.map do |ranking|
      ranking['res'].map do |nomes|
        nomes = nomes.fetch_values('nome', 'ranking', 'frequencia')
      end
    end
  end
  def self.nomes_sexo
    id = gets.chomp
    print 'Digite M ou F '
    sexo = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?=#{sexo}?localidade=#{id}")
    json = JSON.parse(response.body, symbolize_keys: true)
    json.map do |ranking|
      ranking = ranking
      end
    end
end