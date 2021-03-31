require 'faraday'
require 'sqlite3'
require 'json'
require_relative 'ibge_dados'
class RankingNomes

  def initialize(localidade,sexo,nome,frequencia,ranking)
  @sigla = IbgeDados.estados_all
  @sexo = sexo  
  @nome = nome
  @frequencia = frequencia
  @ranking = ranking
  end

  def self.nomes_all
  response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade?')
  json = JSON.parse(response.body, symbolize_names: true)
  json.map do |nomes|
  nomes = nomes[:localidade],[:res]
  end

  end
end