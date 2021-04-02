require_relative 'ibge_dados'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor :localidade, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade,sexo,nome,frequencia,ranking)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
  end
  
  #def self.nomes_all
   # p response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/groupBy=')
    #p response.body #json = JSON.parse(response.body, symbolize_names: true)
    #json.map do |nomes|
    #nomes = nomes[:regiao]
    
    
  

end


