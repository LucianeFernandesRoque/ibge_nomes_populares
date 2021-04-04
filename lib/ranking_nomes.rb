require_relative 'ibge_dados'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor  :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade,sexo,nome,frequencia,ranking)
    @regiao = regiao
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
  end
  
  def self.nomes_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=35') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |nomes|
    nomes = nomes[:nome],nomes[:id]
  end
  end
    print RankingNomes.nomes_all
end


