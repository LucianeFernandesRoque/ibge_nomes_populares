require 'faraday'
class IbgeDados
  attr_accessor  :id, :sigla , :nome

  #variaveis da classe

  def initialize(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome  
  end


  def self.all
    estado = []
    response << Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    response = json.map do |item|
    estado << response.new(item[:id], item[:sigla], item[:nome])
  end
  end
 
p estado.body
   
end


