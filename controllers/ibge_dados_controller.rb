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
    dados = []
    json = JSON.parse( response.body, symbolize_names: true )
    result = json.map do |result|
    dados << new(id: item[ :id], sigla: item[:sigla], nome: item[:nome])   
     end
  end
    dados

end