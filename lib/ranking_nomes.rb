require_relative 'ibge_dados'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor :id, :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade,sexo,nome,frequencia,ranking)
    @regiao = id.ibge_dados << self
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
  end
  
  def self.nomes_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=3300100')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |nomes|
    nomes = nomes[:nome],nomes[:regiao],nomes[:freq],nomes[:sexo],nomes[:rank]    
   end
  end    
  p self.nomes_all

end


