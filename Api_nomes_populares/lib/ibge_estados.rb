require 'faraday'
class IbgeEstados
    attr_accessor  :estado_id, :sigla , :nome 

  def initialize
    @estado_id = estado_id
    @sigla = sigla
    @nome = nome

  end

  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome') 
    #Json.parse(response.body)
  end
  
end
 p IbgeEstados.estados_all


