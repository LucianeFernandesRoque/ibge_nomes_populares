require 'faraday'
require 'sqlite3'
require 'json'
class IbgeDados
    attr_accessor  :id, :sigla , :nome, :municipio

  def initialize
    @id = id
    @sigla = sigla
    @nome = nome
    @municipio = municipio

  end

  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/distritos') 
    json = JSON.parse(response.body, symbolize_names: true)
    result = json.map do |dado|
    dado = new.dig{{dado[:id]=> dado[:nome]}} 
  end
end
  puts dig.dado
end


