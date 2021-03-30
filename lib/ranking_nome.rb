require 'faraday'
require 'sqlite3'
require 'json'
class RankingNomes

  def initialize(localidade,sexo,nome,frequencia,ranking)
  @localidade = id
  @sexo = sexo  
  @nome = nome
  @frequencia = frequencia
  @ranking = ranking
  end

  def self.nomes_all
  response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking')
  puts json = JSON.parse(response.body, symbolize_names: true)
  json.map do |nomes|
  end
  end

self.nomes_all
end
#localidade:	
#string
#sexo:	
#string
#res:	
#[
# {
#nome:	
#string
#frequencia:	
#number
#ranking:	
#number
#]
#]