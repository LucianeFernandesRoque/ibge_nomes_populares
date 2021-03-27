require 'faraday'
require_relative 'ibge_estados'
   
class IbgeCidades

  def initialize
    @id_cidade = id_cidade
    @cidade =  cidade
    @id_estado.ibge_estado 
  end

  def self.cidades_all
  response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome
')
  end
end
p IbgeCidades.cidades_all