require 'faraday'
require 'json'
class IbgeDados
  attr_accessor  :id, :sigla , :nome

  def initialize(id:, sigla:, nome:)
    @id = id
    @sigla = sigla
    @nome = nome 
  end

  def self.sigla_nome
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome')

    json = JSON.parse( response.body, symbolize_names: true )
    result = json.map do |result|
    result = new(item[ :id, :sigla, :nome])
    end
    result
  end
end