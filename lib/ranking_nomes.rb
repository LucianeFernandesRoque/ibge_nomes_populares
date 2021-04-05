require_relative 'ibge_dados'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor  :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade,sexo,nome,frequencia,ranking)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
  end
  
  def self.nomes_all
    response = Faraday.get('servicodados.ib/api/v2/censos/nomes/ranking?localidade={codigo_UF}') 
     json = JSON.parse(response.body, symbolize_names: true)
    json.map do |nomes|
    nomes = nomes[:localidade]
    end
  
  end
    print RankingNomes.nomes_all
end


